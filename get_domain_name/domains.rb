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
        docker:         "matsuand.github.io/docs.docker.jp.onthefly",
        docker_jp:      "docs.docker.jp",
        jammy:          "manpages.ubuntu.com/manpages/jammy",
        man_linux:      "linuxjm.osdn.jp",
        man_git:        "git-scm.com/docs",
        git_book:       "git-scm.com/book/ja/v2",
    }
    #一覧を表示する
    def self.show_domains
        #初期化の処理
        max_key_length = get_max_key_length
        max_value_length = get_max_value_length
        border_line="[-" + "-"* (max_key_length + max_value_length + " : ".length) + "-]"
        header = "[ " + " " * (max_key_length - "key".length) + "key" + " : value" + " " * (max_value_length - "value".length) + " ]"
        #描画の処理
        puts border_line
        puts header
        puts border_line
        @domains.each do |key, value|
            space_k = "[ " + " " * (max_key_length - key.length)
            space_v = " " * (max_value_length - value.length) + " ]"
            puts "#{space_k}#{key} : #{value}#{space_v}"
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
    private
    #キーの中で最も長いキーの長さを返す。
    def self.get_max_key_length
        max_length_key = @domains.each_key.max_by { |key| key.length }
        max_length_key.length
    end
    #バリューの中で最も長いバーリューの長さを返す。
    def self.get_max_value_length
        max_length_value = @domains.each_value.max_by { |key| key.length }
        max_length_value.length
    end
end