# make sure vim is installed
vim-packages:
  pkg.latest:
    - name: vim

# change the default editor to vim using update-alternatives
set-default-vim:
  alternatives.set:
    - name: editor
    - path: '/usr/bin/vim.basic'
    - require:
      - pkg: vim-packages
