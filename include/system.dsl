system = softwareSystem "Система автодокументации" "Хранение и работа с рабочей документацией" {
            vcs = container "Редактор" {
                visualStudio = component "Visual Studio Code" "Либо любой другой, подходящий"
            }
            localRepository = container "Локальный диск"
            renderingSystem = container "Рендеринг документации" {
                structurizrServer = component "Stucturizr standalone server"
            }
            repo = container "Репозитарий" {
                git = component "Git repository"
                dslModel = component "Dsl model" "Модель в С4 нотации"
                mdModel = component "Md model" "Сценарии, алгоритмы"
                
            }
            builder = container "Пайплайн" "Сборка документации" {
                pipeline = component "Сборочная джоба" "Pull, build structurizr project, build folian project" {
                    tags "repo"
                }
            }
            docsBuilder = container "Сборочник документации" {
                foliant = component "Foliant"
            }
        }