import AVFoundation

final class MusicPlayer {

    private var player: AVAudioPlayer?

    public func playSound(sound: Sound) {
        guard let url = locateSoundFile(for: sound) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

    private func locateSoundFile(for sound: Sound) -> URL? {
        switch sound {
        case .alarmSound:
            return Bundle.main.url(forResource: Files.alarmSoundMp3.name, withExtension: Files.alarmSoundMp3.ext)
        }
    }
}

enum Sound {
    case alarmSound
}
