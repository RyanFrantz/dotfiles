# Inspired by https://github.com/VundleVim/Vundle.vim/wiki#faq4
# Vundle's "BundleInstall" command requires a POSIX-compliant shell.
function updatevundle
    set -lx SHELL (which sh)
    vim +BundleInstall! +BundleClean +qall
end
