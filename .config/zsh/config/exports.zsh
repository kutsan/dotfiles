# Initialize $PATH with system binaries.
path=(
  ~/.local/bin
  ~/.local/share/cargo/bin
  $path
)

if ([[ $OSTYPE != 'linux-android' ]]) {
  path=(
    /usr/local/bin
    /usr/local/sbin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
    $path
  )
}

# macOS specific exports.
if ([[ $OSTYPE =~ 'darwin*' ]]) {
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"

  path=(
    '/usr/local/opt/coreutils/libexec/gnubin'
    '/usr/local/opt/findutils/libexec/gnubin'
    '/usr/local/opt/gnu-sed/libexec/gnubin'
    '/usr/local/opt/grep/libexec/gnubin'
    '/usr/local/opt/curl/bin'
    '/usr/local/opt/ncurses/bin'
    '/usr/local/opt/openssl/bin'
    '/usr/local/opt/python/libexec/bin'
    "$ANDROID_HOME/emulator"
    "$ANDROID_HOME/tools"
    "$ANDROID_HOME/tools/bin"
    "$ANDROID_HOME/platform-tools"
    "$JAVA_HOME"
    $path
  )

  manpath=(
    '/usr/local/opt/coreutils/libexec/gnuman'
    '/usr/local/opt/findutils/libexec/gnuman'
    '/usr/local/opt/gnu-sed/libexec/gnuman'
    '/usr/local/opt/grep/libexec/gnuman'
    '/usr/local/opt/curl/share/man'
    $manpath
  )
}

# Basics
export EDITOR='nvim'
export PAGER='less'
export BROWSER='xdg-open'
export LANG='en_US.UTF-8'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Python
export PYTHONUSERBASE="$HOME/.local"

# Rust
export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"

# man
export MANWIDTH='100'
export MANPAGER="nvim +'set filetype=man' -"

# npm
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
export NPM_CONFIG_CACHE="$HOME/.cache/npm"
export NPM_CONFIG_TMP="$TMPDIR/npm"
export NPM_CONFIG_INIT_AUTHOR_NAME='Kutsan Kaplan'
export NPM_CONFIG_INIT_AUTHOR_EMAIL='me@kutsankaplan.com'
export NPM_CONFIG_INIT_AUTHOR_URL='https://kutsankaplan.com'
export NPM_CONFIG_INIT_LICENSE='GPL-3.0'
export NPM_CONFIG_INIT_VERSION='0.0.0'
export NPM_CONFIG_SIGN_GIT_TAG='true'

# grip
export GRIPHOME="$HOME/.config/grip"

# GnuPG
export GPG_TTY=$(tty)
export GNUPGHOME="$HOME/.config/gnupg"

# fzf
export FZF_DEFAULT_COMMAND="\
  find . \
  \( -type d -name 'node_modules' -o -type d -name '.git' \) -prune \
  -o -type f -print"
export FZF_DEFAULT_COLORS='--color=dark,fg:-1,bg:-1,hl:4,fg+:7,bg+:8,gutter:-1,hl+:4,info:8,border:8,prompt:4,pointer:3,marker:3,spinner:8,header:6'
export FZF_DEFAULT_OPTS="\
  $FZF_DEFAULT_COLORS \
  --exact \
  --no-multi \
  --no-mouse \
  --height='40%' \
  --margin='1,3' \
  --layout='reverse' \
  --info='inline' \
  --no-bold \
  --jump-labels='asdfghjkl;' \
  --bind='ctrl-f:jump-accept'"

# transmission
export TR_AUTH='kutsan:EkYBoNSd6oIUznucRTfQTFCcxC5WeeDaBImPt6I9CncuY9g8mH'

# gcal
export GCAL="\
  --highlighting=\e[41m:\e[0m:\e[33m:\e[0m \
  --pager \
  --starting-day=Monday"

# less
export LESS="\
  --ignore-case \
  --tilde \
  --chop-long-lines \
  --status-column \
  --LONG-PROMPT \
  --jump-target=10 \
  --RAW-CONTROL-CHARS \
  --clear-screen \
  --silent \
  --tabs=4 \
  --shift=5"
export LESSHISTFILE='-' # Disable history.
export LESSKEYRC="$HOME/.config/less/lesskey" # Path of the uncompiled lesskey file.
export LESSKEY="$LESSKEYRC.lwc" # Path of the compiled lesskey file.
export LESS_TERMCAP_md=$'\e[01;34m' # Turn on bold mode.
export LESS_TERMCAP_me=$'\e[0m' # Turn off all attributes.
export LESS_TERMCAP_mh=$'\e[2m' # Turn on dim mode.
export LESS_TERMCAP_mr=$'\e[7m' # Turn on reverse mode.
export LESS_TERMCAP_se=$'\e[27;0m' # Exit standout mode.
export LESS_TERMCAP_so=$'\e[1;33m' # Begin standout mode.
export LESS_TERMCAP_ue=$'\e[24;0m' # Exit underline mode.
export LESS_TERMCAP_us=$'\e[4;1;38;5;250m' # Begin underline mode.

# ls
export LS_COLORS="no=0:fi=0:di=38;5;110:ex=38;5;78;1:ca=38;5;17:ln=target:mh=38;\
5;222;1:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;3;38;5;0:su=38;5;220;1;3;10\
0;1:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:bd=38;5;68:so=38;5;197:cd=38;5;11\
3;1:pi=38;5;126:do=38;5;127:*README=38;5;220;1:*README.rst=38;5;220;1:*LICENSE=3\
8;5;220;1:*COPYING=38;5;220;1:*INSTALL=38;5;220;1:*COPYRIGHT=38;5;220;1:*AUTHORS\
=38;5;220;1:*HISTORY=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*PATENTS=38;5;220;1:*VE\
RSION=38;5;220;1:*NOTICE=38;5;220;1:*CHANGES=38;5;220;1:*.log=38;5;190:*.txt=38;\
5;253:*.etx=38;5;184:*.info=38;5;184:*.markdown=38;5;184:*.md=38;5;184:*.mkd=38;\
5;184:*.nfo=38;5;184:*.pod=38;5;184:*.rst=38;5;184:*.tex=38;5;184:*.textile=38;5\
;184:*.json=38;5;178:*.msg=38;5;178:*.pgn=38;5;178:*.rss=38;5;178:*.xml=38;5;178\
:*.yaml=38;5;178:*.yml=38;5;178:*.RData=38;5;178:*.rdata=38;5;178:*.cbr=38;5;141\
:*.cbz=38;5;141:*.chm=38;5;141:*.djvu=38;5;141:*.pdf=38;5;141:*.PDF=38;5;141:*.d\
ocm=38;5;111;4:*.doc=38;5;111:*.docx=38;5;111:*.eps=38;5;111:*.ps=38;5;111:*.odb\
=38;5;111:*.odt=38;5;111:*.rtf=38;5;111:*.odp=38;5;166:*.pps=38;5;166:*.csv=38;5\
;78:*.ods=38;5;112:*cfg=1:*conf=1:*rc=1:*.ini=1:*.plist=1:*.viminfo=1:*.pcf=1:*.\
psf=1:*.git=38;5;197:*.gitignore=38;5;240:*.gitattributes=38;5;240:*.gitmodules=\
38;5;240:*.awk=38;5;172:*.bash=38;5;172:*.bat=38;5;172:*.BAT=38;5;172:*.sed=38;5\
;172:*.sh=38;5;172:*.zsh=38;5;172:*.vim=38;5;172:*.ahk=38;5;41:*.py=38;5;41:*.pl\
=38;5;208:*.PL=38;5;160:*.t=38;5;114:*.msql=38;5;222:*.mysql=38;5;222:*.pgsql=38\
;5;222:*.sql=38;5;222:*.tcl=38;5;64;1:*.r=38;5;49:*.R=38;5;49:*.gs=38;5;81:*.asm\
=38;5;81:*.cl=38;5;81:*.lisp=38;5;81:*.lua=38;5;81:*.moon=38;5;81:*.c=38;5;81:*.\
C=38;5;81:*.h=38;5;110:*.H=38;5;110:*.tcc=38;5;110:*.c++=38;5;81:*.h++=38;5;110:\
*.hpp=38;5;110:*.hxx=38;5;110:*.ii=38;5;110:*.M=38;5;110:*.m=38;5;110:*.cc=38;5;\
81:*.cs=38;5;81:*.cp=38;5;81:*.cpp=38;5;81:*.cxx=38;5;81:*.cr=38;5;81:*.go=38;5;\
81:*.f=38;5;81:*.for=38;5;81:*.ftn=38;5;81:*.s=38;5;110:*.S=38;5;110:*.rs=38;5;8\
1:*.swift=38;5;219:*.sx=38;5;81:*.hi=38;5;110:*.hs=38;5;81:*.lhs=38;5;81:*.pyc=3\
8;5;240:*.css=38;5;125;1:*.less=38;5;125;1:*.sass=38;5;125;1:*.scss=38;5;125;1:*\
.htm=38;5;125;1:*.html=38;5;125;1:*.jhtm=38;5;125;1:*.mht=38;5;125;1:*.eml=38;5;\
125;1:*.mustache=38;5;125;1:*.coffee=38;5;074;1:*.java=38;5;074;1:*.js=38;5;074;\
1:*.jsm=38;5;074;1:*.jsm=38;5;074;1:*.jsp=38;5;074;1:*.php=38;5;81:*.ctp=38;5;81\
:*.twig=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*Dockerfile=38;5;155:*.\
dockerignore=38;5;240:*Makefile=38;5;155:*MANIFEST=38;5;243:*pm_to_blib=38;5;240\
:*.am=38;5;242:*.in=38;5;242:*.hin=38;5;242:*.scan=38;5;242:*.m4=38;5;242:*.old=\
38;5;242:*.out=38;5;242:*.SKIP=38;5;244:*.diff=38;5;229:*.patch=48;5;197;38;5;23\
2;1:*.bmp=38;5;97:*.tiff=38;5;97:*.tif=38;5;97:*.TIFF=38;5;97:*.cdr=38;5;97:*.gi\
f=38;5;97:*.ico=38;5;97:*.jpeg=38;5;97:*.JPG=38;5;97:*.jpg=38;5;97:*.nth=38;5;97\
:*.png=38;5;97:*.psd=38;5;97:*.xpm=38;5;97:*.ai=38;5;99:*.eps=38;5;99:*.epsf=38;\
5;99:*.drw=38;5;99:*.ps=38;5;99:*.svg=38;5;99:*.avi=38;5;114:*.divx=38;5;114:*.I\
FO=38;5;114:*.m2v=38;5;114:*.m4v=38;5;114:*.mkv=38;5;114:*.MOV=38;5;114:*.mov=38\
;5;114:*.mp4=38;5;114:*.mpeg=38;5;114:*.mpg=38;5;114:*.ogm=38;5;114:*.rmvb=38;5;\
114:*.sample=38;5;114:*.wmv=38;5;114:*.3g2=38;5;115:*.3gp=38;5;115:*.gp3=38;5;11\
5:*.webm=38;5;115:*.gp4=38;5;115:*.asf=38;5;115:*.flv=38;5;115:*.ts=38;5;115:*.o\
gv=38;5;115:*.f4v=38;5;115:*.VOB=38;5;115;1:*.vob=38;5;115;1:*.3ga=38;5;137;1:*.\
S3M=38;5;137;1:*.aac=38;5;137;1:*.au=38;5;137;1:*.dat=38;5;137;1:*.dts=38;5;137;\
1:*.fcm=38;5;137;1:*.m4a=38;5;137;1:*.mid=38;5;137;1:*.midi=38;5;137;1:*.mod=38;\
5;137;1:*.mp3=38;5;137;1:*.mp4a=38;5;137;1:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.o\
pus=38;5;137;1:*.s3m=38;5;137;1:*.sid=38;5;137;1:*.wma=38;5;137;1:*.ape=38;5;136\
;1:*.aiff=38;5;136;1:*.cda=38;5;136;1:*.flac=38;5;136;1:*.alac=38;5;136;1:*.midi\
=38;5;136;1:*.pcm=38;5;136;1:*.wav=38;5;136;1:*.wv=38;5;136;1:*.wvc=38;5;136;1:*\
.afm=38;5;66:*.fon=38;5;66:*.fnt=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.ttf=38;5;\
66:*.otf=38;5;66:*.PFA=38;5;66:*.pfa=38;5;66:*.7z=38;5;40:*.a=38;5;40:*.arj=38;5\
;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=\
38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.t\
gz=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.Z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.z\
oo=38;5;40:*.zpaq=38;5;40:*.zz=38;5;40:*.apk=38;5;215:*.deb=38;5;215:*.rpm=38;5;\
215:*.jad=38;5;215:*.jar=38;5;215:*.cab=38;5;215:*.pak=38;5;215:*.pk3=38;5;215:*\
.vdf=38;5;215:*.vpk=38;5;215:*.bsp=38;5;215:*.dmg=38;5;215:*.r[0-9]{0,2}=38;5;23\
9:*.zx[0-9]{0,2}=38;5;239:*.z[0-9]{0,2}=38;5;239:*.part=38;5;239:*.dmg=38;5;124:\
*.iso=38;5;124:*.bin=38;5;124:*.nrg=38;5;124:*.qcow=38;5;124:*.sparseimage=38;5;\
124:*.toast=38;5;124:*.vcd=38;5;124:*.vmdk=38;5;124:*.accdb=38;5;60:*.accde=38;5\
;60:*.accdr=38;5;60:*.accdt=38;5;60:*.db=38;5;60:*.fmp12=38;5;60:*.fp7=38;5;60:*\
.localstorage=38;5;60:*.mdb=38;5;60:*.mde=38;5;60:*.sqlite=38;5;60:*.typelib=38;\
5;60:*.nc=38;5;60:*.pacnew=38;5;33:*.un~=38;5;241:*.orig=38;5;241:*.BUP=38;5;241\
:*.bak=38;5;241:*.o=38;5;241:*.rlib=38;5;241:*.swp=38;5;244:*.swo=38;5;244:*.tmp\
=38;5;244:*.sassc=38;5;244:*.pid=38;5;248:*.state=38;5;248:*lockfile=38;5;248:*.\
err=38;5;160;1:*.error=38;5;160;1:*.stderr=38;5;160;1:*.dump=38;5;241:*.stackdum\
p=38;5;241:*.zcompdump=38;5;241:*.zwc=38;5;241:*.pcap=38;5;29:*.cap=38;5;29:*.dm\
p=38;5;29:*.DS_Store=38;5;239:*.localized=38;5;239:*.CFUserTextEncoding=38;5;239\
:*.service=38;5;45:*@.service=38;5;45:*.socket=38;5;45:*.swap=38;5;45:*.device=3\
8;5;45:*.mount=38;5;45:*.automount=38;5;45:*.target=38;5;45:*.path=38;5;45:*.tim\
er=38;5;45:*.snapshot=38;5;45:*.allow=38;5;112:*.deny=38;5;196:*.application=38;\
5;116:*.cue=38;5;116:*.description=38;5;116:*.directory=38;5;116:*.m3u=38;5;116:\
*.m3u8=38;5;116:*.md5=38;5;116:*.properties=38;5;116:*.sfv=38;5;116:*.srt=38;5;1\
16:*.theme=38;5;116:*.torrent=38;5;116:*.urlview=38;5;116:*.asc=38;5;192;3:*.bfe\
=38;5;192;3:*.enc=38;5;192;3:*.gpg=38;5;192;3:*.signature=38;5;192;3:*.sig=38;5;\
192;3:*.p12=38;5;192;3:*.pem=38;5;192;3:*.pgp=38;5;192;3:*.asc=38;5;192;3:*.enc=\
38;5;192;3:*.sig=38;5;192;3:*.32x=38;5;213:*.cdi=38;5;213:*.fm2=38;5;213:*.rom=3\
8;5;213:*.sav=38;5;213:*.st=38;5;213:*.a00=38;5;213:*.a52=38;5;213:*.A64=38;5;21\
3:*.a64=38;5;213:*.a78=38;5;213:*.adf=38;5;213:*.atr=38;5;213:*.gb=38;5;213:*.gb\
a=38;5;213:*.gbc=38;5;213:*.gel=38;5;213:*.gg=38;5;213:*.ggl=38;5;213:*.ipk=38;5\
;213:*.j64=38;5;213:*.nds=38;5;213:*.nes=38;5;213:*.sms=38;5;213:*.pot=38;5;7:*.\
pcb=38;5;7:*.mm=38;5;7:*.pod=38;5;7:*.gbr=38;5;7:*.spl=38;5;7:*.scm=38;5;7:*.Rpr\
oj=38;5;11:*.sis=38;5;7:*.1p=38;5;7:*.3p=38;5;7:*.cnc=38;5;7:*.def=38;5;7:*.ex=3\
8;5;7:*.example=38;5;7:*.feature=38;5;7:*.ger=38;5;7:*.map=38;5;7:*.mf=38;5;7:*.\
mfasl=38;5;7:*.mi=38;5;7:*.mtx=38;5;7:*.pc=38;5;7:*.pi=38;5;7:*.plt=38;5;7:*.pm=\
38;5;7:*.rb=38;5;7:*.rdf=38;5;7:*.rst=38;5;7:*.ru=38;5;7:*.sch=38;5;7:*.sty=38;5\
;7:*.sug=38;5;7:*.t=38;5;7:*.tdy=38;5;7:*.tfm=38;5;7:*.tfnt=38;5;7:*.tg=38;5;7:*\
.vcard=38;5;7:*.vcf=38;5;7:*.xln=38;5;7:*.iml=38;5;166:*.xcconfig=1:*.entitlemen\
ts=1:*.strings=1:*.storyboard=38;5;196:*.xcsettings=1:*.xib=38;5;208:"

# lf
export LF_ICONS="tw=:st=:ow=:dt=:di=:fi=:ln=:or=:ex=:\
*.styl=:*.scss=:*.html=:*.css=:*.md=:*.json=:*.js=:*.jsx=:*.rb=:\
*.php=:*.py=:*.pyc=:*.pyo=:*.pyd=:*.conf=:*.ini=:*.yml=:*.bat=:\
*.jpg=:*.jpeg=:*.bmp=:*.png=:*.gif=:*.ico=:*.svg=:*.cpp=:*.c++=:\
*.cxx=:*.cc=:*.cp=:*.c=:*.hs=:*.lhs=:*.lua=:*.java=:*.sh=:*.fish=:\
*.ml=λ:*.mli=λ:*.diff=:*.db=:*.sql=:*.dump=:*.clj=:*.cljc=:*.cljs=:\
*.edn=:*.scala=:*.go=:*.dart=:*.xul=:*.sln=:*.suo=:*.pl=:*.pm=:\
*.t=:*.rss=:*.fsscript=:*.fsx=:*.fs=:*.fsi=:*.rs=:*.rlib=:*.d=:\
*.erl=:*.hrl=:*.vim=:*.vimrc=:*.ai=:*.psd=:*.psb=:*.ts=:*.jl=:*.rc=:\
*.xml=:*.log=:*.avi=:*.mpeg=:*.mpg=:*.mkv=:*.flv=:*.mp4=:*.mp3=:\
*.flac=:*.wav=:*.ogg=:*.epub=:*.pdf=:*.7z=:*.apk=:*.bz2=:*.cab=:\
*.cpio=:*.deb=:*.gem=:*.gz=:*.gzip=:*.lha=:*.lzh=:*.lzma=:*.rar=:\
*.rpm=:*.tar=:*.tgz=:*.xz=:*.zip=:.config::.git=:.ssh=:.Trash=:\
Desktop=:Documents=:Downloads=:Pictures=:Projects=:.DS_Store=:\
.gitconfig=:.gitignore=:.bashrc=:.bashprofile=:favicon.ico=:LICENSE=:\
node_modules=:procfile=:.Xdefaults=:.Xresources=:.dmrc=:.gitconfig=:\
.profile=:.xinputrc=:ini=:config=:"
