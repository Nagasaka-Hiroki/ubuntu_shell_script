#ドメイン情報を保持し、応答を返すクラス。
#インスタンスを生成して使うことは考えていない。
class DomainHolder
    #よく検索するサイトのドメインを列挙する
    @domains={ 
        github:         "github.com",
        gh_rails:       "github.com/rails",
        mdn:            "developer.mozilla.org/ja/docs",
        js:             "developer.mozilla.org/ja/docs/Web/API",
        es:             "jsprimer.net",
        ruby:           "docs.ruby-lang.org/ja",
        rails:          "api.rubyonrails.org",
        rails_guide:    "railsguides.jp",
        rails_guide_en: "guides.rubyonrails.org",
        docker:         "docs.docker.com",
        docker_jp:      "docs.docker.jp",
        jammy:          "manpages.ubuntu.com/manpages/jammy",
        man_linux:      "linuxjm.osdn.jp",
    }
    #一覧を表示する
    def self.show_domains
        border_line="[--------------------------------------------------]"
        puts "[key] : [value]"
        puts border_line
        @domains.each do |key, value|
            puts " #{key} : #{value}"
        end
        puts border_line
    end
    #一致したキーに対応する値を出力する
    def self.print_domain(key)
        if @domains[key]
            @domains[key]
        else
            false
        end
    end
end