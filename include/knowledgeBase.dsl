knowledgeBase = softwareSystem "База знаний" "Отображение рабочей документации" {
            confluenceWebApp = container "Web application" {
                tags "Web app"
                confluence = component "Confluence"
            }
            confluenceDB = container "Хранилище"  {
                tags "db"
                }
            }