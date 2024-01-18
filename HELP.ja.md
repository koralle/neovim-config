# 日本語ヘルプ

## Git管理方法

- `./neovim-orphan-memo`ディレクトリ下で、`main`ブランチから派生ブランチを作成する。
- 派生ブランチをpushする。
- その派生ブランチから`orphan-memo`に対してPull Requestを作成する。
- Pull Requestの内容が問題なければ、`orphan-memo`にmergeする。
- ローカルの`main`ブランチにremoteの`orphan`ブランチの内容をmergeする時は、`git pull origin orphan-memo`を実行する。
- ローカルの`main`ブランチをremoteにpushする際は、`git push origin main:orphan-memo`を実行する。

## 新しいOrphanブランチの作り方

```bash
git clone https://github/project.git # これで projectディレクトリができ、普段はこっちで作業
mkdir ./project-orphan-doc # ここがドキュメント用ディレクトリ
cd project-orphan-doc
git init
git remote add origin https://github/project.git
touch document.doc
git add .
git commit -m '1st orphan-doc commit'
git push origin master:orphan-doc  # ←これでリモートにはブランチ名が orphan-doc でプッシュできるのでエラーがおきない
```

出典：[不安なくOrphanブランチを作る方法 by GitHub(リモートgit)](https://qiita.com/PharaohKJ/items/f90336ce216cf9e57ce2)

## Orphanブランチについて困ったときはここを読む。

※随時追加する。

- [不安なくOrphanブランチを作る方法 by GitHub(リモートgit)](https://qiita.com/PharaohKJ/items/f90336ce216cf9e57ce2)
- [[Git]親のないブランチを作る方法 - FuwaFuwaShoChan BLOG](https://blog.masuyoshi.com/git%E8%A6%AA%E3%81%AE%E3%81%AA%E3%81%84%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81%E3%82%92%E4%BD%9C%E3%82%8B%E6%96%B9%E6%B3%95/)
