import librosa
import numpy as np
from music21 import stream, note, tempo
import os
import matplotlib.pyplot as plt

# Função para carregar e processar um arquivo MP3
def load_audio_from_mp3(file_path):
    print(f"Carregando o arquivo de áudio: {file_path}")
    audio_data, sample_rate = librosa.load(file_path, sr=None)  # sr=None para manter a taxa de amostragem original
    return audio_data, sample_rate

# Converter a frequência em uma nota musical
def frequency_to_note(frequency):
    # A tabela de notas em Hz (exemplo simplificado, inclui apenas as notas principais)
    notes = {
        261.63: 'C4',  # Dó
        293.66: 'D4',  # Ré
        329.63: 'E4',  # Mi
        349.23: 'F4',  # Fá
        392.00: 'G4',  # Sol
        440.00: 'A4',  # Lá
        493.88: 'B4',  # Si
        523.25: 'C5'   # Dó
    }

    closest_note = min(notes.keys(), key=lambda x: abs(x - frequency))
    return notes[closest_note]

# Função para encontrar as notas no arquivo de áudio com duração
def detect_notes(audio_data, sample_rate, hop_length=512):
    print("Detectando notas no áudio...")
    
    # Transformada de Fourier para obter a frequência dominante
    D = librosa.stft(audio_data, hop_length=hop_length)  # Short-time Fourier transform
    freqs = librosa.fft_frequencies(sr=sample_rate)  # Frequências correspondentes
    times = librosa.times_like(D)  # Tempos correspondentes
    
    notes_detected = []
    note_durations = []
    
    # Encontrar a frequência dominante em cada intervalo de tempo
    for i in range(D.shape[1]):
        magnitude = np.abs(D[:, i])  # Magnitude do espectro
        index = np.argmax(magnitude)  # Índice da maior magnitude
        dominant_frequency = freqs[index]
        
        # Convertendo a frequência para a nota musical
        note_name = frequency_to_note(dominant_frequency)
        notes_detected.append(note_name)
        
        # Calcular a duração com base no intervalo de tempo
        duration = librosa.frames_to_time(i, hop_length=hop_length)  # Converte o tempo da frame para segundos
        note_durations.append(duration)
    
    return notes_detected, note_durations, times

# Função para criar a partitura com Music21
def create_score(notes_sequence, durations):
    score = stream.Score()
    part = stream.Part()

    # Definir o tempo da partitura (exemplo: 120 bpm)
    part.append(tempo.MetronomeMark(number=120))

    # Adicionar notas à partitura com base na sequência e nas durações
    for note_name, duration in zip(notes_sequence, durations):
        new_note = note.Note(note_name)
        new_note.quarterLength = duration  # Usando a duração calculada
        part.append(new_note)

    score.append(part)

    return score

# Função principal para processar o arquivo MP3 e gerar o MusicXML
def main(file_path):
    print(f"Iniciando o processamento do arquivo MP3: {file_path}")
    
    # Carregar o arquivo MP3
    audio_data, sample_rate = load_audio_from_mp3(file_path)

    # Detectar as notas no áudio
    notes_sequence, note_durations, times = detect_notes(audio_data, sample_rate)
    print(f"Notas detectadas: {notes_sequence[:10]}...")  # Exibindo as primeiras 10 notas para checar

    # Criar a partitura com as notas detectadas
    score = create_score(notes_sequence, note_durations)
    
    # Gerar o MusicXML
    print("Gerando partitura em MusicXML...")
    score.write('musicxml', fp='output.musicxml')  # Salvar em formato MusicXML

if __name__ == "__main__":
    mp3_file_path = r'C:\Users\ead\Desktop\redesnneurais-tarde\aplicativo\sonscerrado.mp3'  # Caminho correto do seu MP3
    
    if os.path.exists(mp3_file_path):
        main(mp3_file_path)
    else:
        print(f"Arquivo MP3 não encontrado: {mp3_file_path}")
