#:title:        Divine deployment: fonts
#:author:       Grove Pyree
#:email:        grayarea@protonmail.ch
#:revdate:      2019.12.01
#:revremark:    Initial commit
#:created_at:   2019.06.30

D_DPL_NAME='fonts'
D_DPL_DESC='Personal collection of hard-to-come-by font faces'
D_DPL_PRIORITY=4096
D_DPL_FLAGS=
D_DPL_WARNING=
D_DPL_OS=( macos ubuntu )

d_dpl_check()   { assemble_tasks; d__mltsk_check;   }
d_dpl_install() {                 d__mltsk_install; }
d_dpl_remove()  {                 d__mltsk_remove;  }

assemble_tasks()
{
  # Assemble multitask deployment
  D_MLTSK_MAIN=( 'ttf' 'otf' )

  # Auto-target the asset queue
  case $D__OS_DISTRO in
    macos)  d__queue_target "$HOME/Library/Fonts";;
    ubuntu) d__queue_target --section 0 '/usr/share/fonts'
            d__queue_target --section 1 '/usr/share/fonts/opentype';;
  esac
}

d_ttf_check()   { d__copy_queue_check;    }
d_ttf_install() { d__copy_queue_install;  }
d_ttf_remove()  { d__copy_queue_remove;   }

d_otf_check()   { d__copy_queue_check;    }
d_otf_install() { d__copy_queue_install;  }
d_otf_remove()  { d__copy_queue_remove;   }