import Foundation

struct Video {
    let title: String
    let views: Int
    let url: String
}

func generateSampleVideos() -> [Video] {
    return [
        Video(title: "Котики", views: 5111, url: "https://example.com/video1"),
        Video(title: "Багато котиків", views: 3222, url: "https://example.com/video2"),
        Video(title: "Фабрика котиків", views: 4123, url: "https://example.com/video3"),
        Video(title: "Немає котиків", views: 41249, url: "https://example.com/video4"),
        Video(title: "Депресія", views: 2540, url: "https://example.com/video5"),
        Video(title: "Відчай", views: 1805, url: "https://example.com/video6"),
        Video(title: "Допоможіть", views: 27909, url: "https://example.com/video7"),
        Video(title: "Ломка", views: 2905, url: "https://example.com/video8"),
        Video(title: "Конвульсії", views: 2206, url: "https://example.com/video9"),
        Video(title: "Смерть", views: 99999, url: "https://example.com/video10")
    ]
}


func main() {
    let videos = generateSampleVideos()
    
    while true {
        print("""
        Обери дію:
        1. Показати всі відео
        2. Знайти відео за назвою
        3. Сортувати відео за кількістю переглядів
        4. Показати детальну інформацію про відео
        5. Вийти
        """)
        
        guard let choice = readLine(), let option = Int(choice) else {
                  print("числа від 1 до 5")
            continue
        }
        
        switch option {
        case 1:
            print("Список відео:")
            printVideos(videos)
        case 2:
            print("Введіть назву для пошуку відео:")
            if let searchTerm = readLine() {
                let results = searchVideos(by: searchTerm, in: videos)
                if results.isEmpty {
                    print("Відео не знайдено")
                } else {
                    print("Знайдені відео:")
                    printVideos(results)
                }
            }
        case 3:
            let sortedVideos = sortVideosByViews(videos)
            print("Відео за кількістю переглядів:")
            printVideos(sortedVideos)
        case 4:
            print("Введіть номер відео для перегляду деталей:")
            if let input = readLine(), let index = Int(input), index > 0, index <= videos.count {
                print("Деталі відео:")
                printVideoDetails(video: videos[index - 1])
            } else {
                print("Такого номеру немає")
            }
        case 5:
            return
        default:
            print("Такого варіанту не існує.")
        }
    }
}

func printVideos(_ videos: [Video]) {
    for (index, video) in videos.enumerated() {
        print("\(index + 1). Назва: \(video.title), Перегляди: \(video.views)")
    }
}

func searchVideos(by title: String, in videos: [Video]) -> [Video] {
    return videos.filter { $0.title.lowercased().contains(title.lowercased()) }
}

func sortVideosByViews(_ videos: [Video]) -> [Video] {
    return videos.sorted { $0.views > $1.views }
}

func printVideoDetails(video: Video) {
    print("Назва: \(video.title)")
    print("Перегляди: \(video.views)")
    print("Посилання: \(video.url)")
}

main()
