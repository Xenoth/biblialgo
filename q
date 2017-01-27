GROFF(1)                    General Commands Manual                    GROFF(1)

NNAAMMEE
       groff - front-end for the groff document formatting system

SSYYNNOOPPSSIISS
       ggrrooffff [--aabbcceeggiijjkkllppssttzzCCEEGGNNRRSSUUVVXXZZ] [--dd _c_s] [--DD _a_r_g] [--ff _f_a_m] [--FF _d_i_r]
             [--II _d_i_r] [--KK _a_r_g] [--LL _a_r_g] [--mm _n_a_m_e] [--MM _d_i_r] [--nn _n_u_m] [--oo _l_i_s_t]
             [--PP _a_r_g] [--rr _c_n] [--TT _d_e_v] [--ww _n_a_m_e] [--WW _n_a_m_e] [_f_i_l_e ...]
       ggrrooffff --hh | ----hheellpp
       ggrrooffff --vv | ----vveerrssiioonn [_o_p_t_i_o_n ...]

DDEESSCCRRIIPPTTIIOONN
       This  document  describes  the ggrrooffff program, the main front-end for the
       _g_r_o_f_f document formatting system.  The _g_r_o_f_f program and macro suite  is
       the  implementation of a rrooffff(7) system within the free software collec‐
       tion GNU ⟨http://www.gnu.org⟩.  The _g_r_o_f_f system has all features of the
       classical _r_o_f_f, but adds many extensions.

       The  ggrrooffff  program  allows to control the whole _g_r_o_f_f system by command
       line options.  This is a great simplification in comparison to the clas‐
       sical case (which uses pipes only).

OOPPTTIIOONNSS
       The  command  line is parsed according to the usual GNU convention.  The
       whitespace between a command line option and its argument  is  optional.
       Options  can  be grouped behind a single ‘-’ (minus character).  A file‐
       name of -- (minus character) denotes the standard input.

       As ggrrooffff is a wrapper program for ttrrooffff both programs  share  a  set  of
       options.   But the ggrrooffff program has some additional, native options and
       gives a new meaning to some ttrrooffff options.  On the other hand,  not  all
       ttrrooffff options can be fed into ggrrooffff.

   NNaattiivvee ggrrooffff OOppttiioonnss
       The  following  options either do not exist for ttrrooffff or are differently
       interpreted by ggrrooffff.

       --DD _a_r_g Set default input encoding used by pprreeccoonnvv to _a_r_g.  Implies --kk.

       --ee     Preprocess with eeqqnn.

       --gg     Preprocess with ggrrnn.

       --GG     Preprocess with ggrraapp.  Implies --pp.

       --hh
       ----hheellpp Print a help message.

       --II _d_i_r This option may be used to specify  a  directory  to  search  for
              files  (both  those  on the command line and those named in ..ppssbbbb
              and ..ssoo requests, and \\XX''ppss:: iimmppoorrtt'' and \\XX''ppss::  ffiillee''  escapes).
              The  current directory is always searched first.  This option may
              be specified more than once; the directories are searched in  the
              order  specified.   No  directory  search  is performed for files
              specified using an absolute path.  This  option  implies  the  --ss
              option.

       --jj     Preprocess with cchheemm.  Implies --pp.

       --kk     Preprocess with pprreeccoonnvv.  This is run before any other preproces‐
              sor.  Please refer to pprreeccoonnvv's manual page for its behaviour  if
              no --KK (or --DD) option is specified.

       --KK _a_r_g Set input encoding used by pprreeccoonnvv to _a_r_g.  Implies --kk.

       --ll     Send  the  output to a spooler program for printing.  The command
              that should be used for this is specified by the pprriinntt command in
              the  device description file, see ggrrooffff__ffoonntt(5).  If this command
              is not present, the output is piped into the  llpprr(1)  program  by
              default.  See options --LL and --XX.

       --LL _a_r_g Pass  _a_r_g  to  the  spooler program.  Several arguments should be
              passed with a separate -L option each.  Note that ggrrooffff does  not
              prepend  ‘-’  (a  minus  sign)  to  _a_r_g  before passing it to the
              spooler program.

       --NN     Don't allow newlines within _e_q_n delimiters.  This is the same  as
              the --NN option in eeqqnn.

       --pp     Preprocess with ppiicc.

       --PP _-_o_p_t_i_o_n
       --PP _-_o_p_t_i_o_n --PP _a_r_g
              Pass  _-_o_p_t_i_o_n  or  _-_o_p_t_i_o_n  _a_r_g to the postprocessor.  The option
              must be specified with the necessary preceding minus sign(s)  ‘-’
              or  ‘--’ because ggrrooffff does not prepend any dashes before passing
              it to the postprocessor.  For example, to pass  a  title  to  the
              ggxxddiittvviieeww postprocessor, the shell command

                     groff -X -P -title -P 'groff it' _f_o_o

              is equivalent to

                     groff -X -Z _f_o_o | gxditview -title 'groff it' -

       --RR     Preprocess  with  rreeffeerr.   No  mechanism  is provided for passing
              arguments to rreeffeerr because most  rreeffeerr  options  have  equivalent
              language elements that can be specified within the document.  See
              rreeffeerr(1) for more details.

       --ss     Preprocess with ssooeelliimm.

       --SS     Safer mode.  Pass the --SS option to ppiicc and disable the  following
              ttrrooffff  requests: ..ooppeenn, ..ooppeennaa, ..ppssoo, ..ssyy, and ..ppii.  For security
              reasons, safer mode is enabled by default.

       --tt     Preprocess with ttbbll.

       --TT _d_e_v Set output device to _d_e_v.  For this device, ttrrooffff  generates  the
              _i_n_t_e_r_m_e_d_i_a_t_e  _o_u_t_p_u_t; see ggrrooffff__oouutt(5).  Then ggrrooffff calls a post‐
              processor to convert ttrrooffff's _i_n_t_e_r_m_e_d_i_a_t_e  _o_u_t_p_u_t  to  its  final
              format.  Real devices in ggrrooffff are

                     dvi    TeX DVI format (postprocessor is ggrrooddvvii).

                     html
                     xhtml  HTML and XHTML output (preprocessors are ssooeelliimm and
                            pprree--ggrroohhttmmll, postprocessor is ppoosstt--ggrroohhttmmll).

                     lbp    Canon CAPSL printers (LBP-4 and LBP-8 series  laser
                            printers; postprocessor is ggrroollbbpp).

                     lj4    HP  LaserJet4 compatible (or other PCL5 compatible)
                            printers (postprocessor is ggrroolljj44).

                     ps     PostScript output (postprocessor is ggrrooppss).

                     pdf    Portable Document Format (PDF) output  (postproces‐
                            sor is ggrrooppddff).

              For  the  following  TTY  output devices (postprocessor is always
              ggrroottttyy), --TT selects the output encoding:

                     ascii  7bit ASCII.

                     cp1047 Latin-1 character set for EBCDIC hosts.

                     latin1 ISO 8859-1.

                     utf8   Unicode character set in UTF-8 encoding.  This mode
                            has  the  most  useful fonts for TTY mode, so it is
                            the best mode for TTY output.

              The following arguments select ggxxddiittvviieeww as  the  ‘postprocessor’
              (it is rather a viewing program):

                     X75    75dpi resolution, 10pt document base font.

                     X75-12 75dpi resolution, 12pt document base font.

                     X100   100dpi resolution, 10pt document base font.

                     X100-12
                            100dpi resolution, 12pt document base font.

              The default device is ppss.

       --UU     Unsafe  mode.   Reverts to the (old) unsafe behaviour; see option
              --SS.

       --vv
       ----vveerrssiioonn
              Output version information of ggrrooffff and of all programs that  are
              run by it; that is, the given command line is parsed in the usual
              way, passing --vv to all subprograms.

       --VV     Output the pipeline that would be run by ggrrooffff (as a wrapper pro‐
              gram)  on  the  standard output, but do not execute it.  If given
              more than once, the commands are both  printed  on  the  standard
              error and run.

       --XX     Use  ggxxddiittvviieeww  instead  of  using  the  usual  postprocessor  to
              (pre)view a document.  The printing spooler behavior as  outlined
              with  options --ll and --LL is carried over to ggxxddiittvviieeww(1) by deter‐
              mining an argument for the --pprriinnttCCoommmmaanndd option of  ggxxddiittvviieeww(1).
              This  sets  the  default  PPrriinntt action and the corresponding menu
              entry to that value.  --XX only produces good  results  with  --TTppss,
              --TTXX7755,  --TTXX7755--1122,  --TTXX110000, and --TTXX110000--1122.  The default resolution
              for previewing --TTppss output is 75dpi; this can be changed by pass‐
              ing the --rreessoolluuttiioonn option to ggxxddiittvviieeww, for example

                     groff -X -P-resolution -P100 -man foo.1

       --zz     Suppress  output  generated  by  ttrrooffff.   Only error messages are
              printed.

       --ZZ     Do not automatically postprocess _g_r_o_f_f _i_n_t_e_r_m_e_d_i_a_t_e _o_u_t_p_u_t in the
              usual  manner.   This  will  cause  the ttrrooffff _o_u_t_p_u_t to appear on
              standard output, replacing the usual  postprocessor  output;  see
              ggrrooffff__oouutt(5).

   TTrraannssppaarreenntt OOppttiioonnss
       The  following  options  are  transparently handed over to the formatter
       program ttrrooffff that is called by ggrrooffff subsequently.  These  options  are
       described in more detail in ttrrooffff(1).

       --aa     ASCII approximation of output.

       --bb     Backtrace on error or warning.

       --cc     Disable  color output.  Please consult the ggrroottttyy(1) man page for
              more details.

       --CC     Enable compatibility mode.

       --dd _c_s
       --dd _n_a_m_e==_s
              Define string.

       --EE     Disable ttrrooffff error messages.

       --ff _f_a_m Set default font family.

       --FF _d_i_r Set path for font DESC files.

       --ii     Process standard input after the specified input files.

       --mm _n_a_m_e
              Include  macro  file   _n_a_m_e..ttmmaacc   (or   ttmmaacc.._n_a_m_e);   see   also
              ggrrooffff__ttmmaacc(5).

       --MM _d_i_r Path for macro files.

       --nn _n_u_m Number the first page _n_u_m.

       --oo _l_i_s_t
              Output only pages in _l_i_s_t.

       --rr _c_n
       --rr _n_a_m_e==_n
              Set number register.

       --ww _n_a_m_e
              Enable warning _n_a_m_e.  See ttrrooffff(1) for names.

       --WW _n_a_m_e
              disable warning _n_a_m_e.  See ttrrooffff(1) for names.

UUSSIINNGG GGRROOFFFF
       The  _g_r_o_f_f  _s_y_s_t_e_m  implements the infrastructure of classical roff; see
       rrooffff(7) for a survey on how a _r_o_f_f system works in general.  Due to  the
       front-end  programs  available  within  the _g_r_o_f_f system, using _g_r_o_f_f is
       much easier than _c_l_a_s_s_i_c_a_l _r_o_f_f.  This section gives an overview of  the
       parts  that  constitute  the  _g_r_o_f_f system.  It complements rrooffff(7) with
       _g_r_o_f_f-specific features.  This section can be regarded as a guide to the
       documentation around the _g_r_o_f_f system.

   PPaappeerr SSiizzee
       The  _v_i_r_t_u_a_l  paper size used by ttrrooffff to format the input is controlled
       globally with the requests ..ppoo, ..ppll, and ..llll.  See ggrrooffff__ttmmaacc(5) for the
       ‘papersize’ macro package which provides a convenient interface.

       The  _p_h_y_s_i_c_a_l  paper  size,  giving  the  actual dimensions of the paper
       sheets, is controlled by output devices like ggrrooppss with the command line
       options  --pp  and  --ll.  See ggrrooffff__ffoonntt(5) and the man pages of the output
       devices for more details.  ggrrooffff uses the command line option --PP to pass
       options  to  output devices; for example, the following selects A4 paper
       in landscape orientation for the PS device:

              groff -Tps -P-pa4 -P-l ...

   FFrroonntt--eennddss
       The ggrrooffff program is a wrapper around the ttrrooffff(1) program.   It  allows
       to  specify  the preprocessors by command line options and automatically
       runs the postprocessor that is  appropriate  for  the  selected  device.
       Doing  so,  the  sometimes tedious piping mechanism of classical rrooffff(7)
       can be avoided.

       The ggrroogg(1) program can be used for guessing the correct  _g_r_o_f_f  command
       line to format a file.

       The  ggrrooffffeerr(1)  program  is  an allround-viewer for _g_r_o_f_f files and man
       pages.

   PPrreepprroocceessssoorrss
       The _g_r_o_f_f preprocessors are  reimplementations  of  the  classical  pre‐
       processors  with  moderate  extensions.  The standard preprocessors dis‐
       tributed with the _g_r_o_f_f package are

       eeqqnn(1) for mathematical formulae,

       ggrrnn(1) for including ggrreemmlliinn(1) pictures,

       ppiicc(1) for drawing diagrams,

       cchheemm(1)
              for chemical structure diagrams,

       rreeffeerr(1)
              for bibliographic references,

       ssooeelliimm(1)
              for including macro files from standard locations,

       and

       ttbbll(1) for tables.

       A new preprocessor not available in classical _t_r_o_f_f is pprreeccoonnvv(1)  which
       converts  various input encodings to something ggrrooffff can understand.  It
       is always run first before any other preprocessor.

       Besides these, there are some internal preprocessors that are  automati‐
       cally run with some devices.  These aren't visible to the user.

   MMaaccrroo PPaacckkaaggeess
       Macro  packages  can  be included by option --mm.  The _g_r_o_f_f system imple‐
       ments and extends all classical macro packages in a compatible  way  and
       adds  some  packages of its own.  Actually, the following macro packages
       come with _g_r_o_f_f:

       mmaann    The traditional man page format; see  ggrrooffff__mmaann(7).   It  can  be
              specified on the command line as --mmaann or --mm mmaann.

       mmaannddoocc The  general  package  for man pages; it automatically recognizes
              whether the documents  uses  the  _m_a_n  or  the  _m_d_o_c  format  and
              branches to the corresponding macro package.  It can be specified
              on the command line as --mmaannddoocc or --mm mmaannddoocc.

       mmddoocc   The BSD-style man page format;  see  ggrrooffff__mmddoocc(7).   It  can  be
              specified on the command line as --mmddoocc or --mm mmddoocc.

       mmee     The  classical  _m_e  document  format; see ggrrooffff__mmee(7).  It can be
              specified on the command line as --mmee or --mm mmee.

       mmmm     The classical _m_m document format; see  ggrrooffff__mmmm(7).   It  can  be
              specified on the command line as --mmmm or --mm mmmm.

       mmss     The  classical  _m_s  document  format; see ggrrooffff__mmss(7).  It can be
              specified on the command line as --mmss or --mm mmss.

       wwwwww    HTML-like macros for inclusion in arbitrary _g_r_o_f_f documents;  see
              ggrrooffff__wwwwww(7).

       Details on the naming of macro files and their placement can be found in
       ggrrooffff__ttmmaacc(5); this man page also documents some other, minor  auxiliary
       macro packages not mentioned here.

   PPrrooggrraammmmiinngg LLaanngguuaaggee
       General  concepts common to all _r_o_f_f programming languages are described
       in rrooffff(7).

       The _g_r_o_f_f extensions to the classical _t_r_o_f_f language are  documented  in
       ggrrooffff__ddiiffff(7).

       The  _g_r_o_f_f  language  as  a whole is described in the (still incomplete)
       _g_r_o_f_f _i_n_f_o _f_i_l_e; a short  (but  complete)  reference  can  be  found  in
       ggrrooffff(7).

   FFoorrmmaatttteerrss
       The central _r_o_f_f formatter within the _g_r_o_f_f system is ttrrooffff(1).  It pro‐
       vides the features of both the classical _t_r_o_f_f and _n_r_o_f_f, as well as the
       _g_r_o_f_f  extensions.   The command line option --CC switches ttrrooffff into _c_o_m_‐
       _p_a_t_i_b_i_l_i_t_y _m_o_d_e which tries to emulate classical _r_o_f_f as much as  possi‐
       ble.

       There is a shell script nnrrooffff(1) that emulates the behavior of classical
       nnrrooffff.  It tries to automatically select  the  proper  output  encoding,
       according to the current locale.

       The formatter program generates _i_n_t_e_r_m_e_d_i_a_t_e _o_u_t_p_u_t; see ggrrooffff__oouutt(7).

   DDeevviicceess
       In _r_o_f_f, the output targets are called _d_e_v_i_c_e_s.  A device can be a piece
       of hardware, e.g., a printer, or a software file format.   A  device  is
       specified by the option --TT.  The _g_r_o_f_f devices are as follows.

       aasscciiii  Text output using the aasscciiii(7) character set.

       ccpp11004477 Text  output  using the EBCDIC code page IBM cp1047 (e.g., OS/390
              Unix).

       ddvvii    TeX DVI format.

       hhttmmll   HTML output.

       llaattiinn11 Text output using the ISO Latin-1 (ISO 8859-1) character set; see
              iissoo__88885599__11(7).

       llbbpp    Output  for  Canon  CAPSL  printers (LBP-4 and LBP-8 series laser
              printers).

       lljj44    HP LaserJet4-compatible (or other PCL5-compatible) printers.

       ppss     PostScript output; suitable  for  printers  and  previewers  like
              ggvv(1).

       ppddff    PDF  files; suitable for viewing with tools such as eevviinnccee(1) and
              ookkuullaarr(1).

       uuttff88   Text output using the Unicode  (ISO  10646)  character  set  with
              UTF-8 encoding; see uunniiccooddee(7).

       xxhhttmmll  XHTML output.

       XX7755    75dpi   X  Window  System  output  suitable  for  the  previewers
              xxddiittvviieeww(1x) and ggxxddiittvviieeww(1).  A variant  for  a  12pt  document
              base font is XX7755--1122.

       XX110000   100dpi  X  Window  System  output  suitable  for  the  previewers
              xxddiittvviieeww(1x) and ggxxddiittvviieeww(1).  A variant  for  a  12pt  document
              base font is XX110000--1122.

       The  postprocessor  to  be used for a device is specified by the ppoossttpprroo
       command in the device description file; see ggrrooffff__ffoonntt(5).  This can  be
       overridden with the --XX option.

       The default device is ppss.

   PPoossttpprroocceessssoorrss
       _g_r_o_f_f provides 3 hardware postprocessors:

       ggrroollbbpp(1)
              for some Canon printers,

       ggrroolljj44(1)
              for printers compatible to the HP LaserJet 4 and PCL5,

       ggrroottttyy(1)
              for  text  output using various encodings, e.g., on text-oriented
              terminals or line-printers.

       Today, most printing or drawing hardware is  handled  by  the  operating
       system,  by device drivers, or by software interfaces, usually accepting
       PostScript.  Consequently, there isn't an urgent need for more  hardware
       device postprocessors.

       The  _g_r_o_f_f software devices for conversion into other document file for‐
       mats are

       ggrrooddvvii(1)
              for the DVI format,

       ggrroohhttmmll(1)
              for HTML and XHTML formats,

       ggrrooppss(1)
              for PostScript.

       ggrrooppddff(1)
              for PDF.

       Combined with the many existing free conversion  tools  this  should  be
       sufficient  to convert a _t_r_o_f_f document into virtually any existing data
       format.

   UUttiilliittiieess
       The following utility programs around _g_r_o_f_f are available.

       aaddddffttiinnffoo(1)
              Add information to _t_r_o_f_f font  description  files  for  use  with
              _g_r_o_f_f.

       aaffmmttooddiitt(1)
              Create font description files for PostScript device.

       eeqqnn22ggrraapphh(1)
              Convert an eeqqnn image into a cropped image.

       ggddiiffffmmkk(1)
              Mark differences between _g_r_o_f_f, _n_r_o_f_f, or _t_r_o_f_f files.

       ggrraapp22ggrraapphh(1)
              Convert a ggrraapp diagram into a cropped bitmap image.

       ggrrooffffeerr(1)
              General viewer program for _g_r_o_f_f files and man pages.

       ggxxddiittvviieeww(1)
              The _g_r_o_f_f X viewer, the GNU version of xxddiittvviieeww.

       hhppffttooddiitt(1)
              Create font description files for lj4 device.

       iinnddxxbbiibb(1)
              Make inverted index for bibliographic databases.

       llkkbbiibb(1)
              Search bibliographic databases.

       llooookkbbiibb(1)
              Interactively search bibliographic databases.

       ppddffrrooffff(1)
              Create PDF documents using ggrrooffff.

       ppffbbttooppss(1)
              Translate a PostScript font in .pfb format to ASCII.

       ppiicc22ggrraapphh(1)
              Convert a ppiicc diagram into a cropped image.

       ttffmmttooddiitt(1)
              Create font description files for TeX DVI device.

       xxddiittvviieeww(1x)
              _r_o_f_f viewer distributed with X window.

       xxttoottrrooffff(1)
              Convert X font metrics into GNU _t_r_o_f_f font metrics.

EENNVVIIRROONNMMEENNTT
       Normally,  the  path separator in the following environment variables is
       the colon; this may vary depending on the operating system.   For  exam‐
       ple, DOS and Windows use a semicolon instead.

       GGRROOFFFF__BBIINN__PPAATTHH
              This  search  path,  followed by $$PPAATTHH, is used for commands that
              are executed by ggrrooffff.  If it is not set then the directory where
              the _g_r_o_f_f binaries were installed is prepended to PPAATTHH.

       GGRROOFFFF__CCOOMMMMAANNDD__PPRREEFFIIXX
              When there is a need to run different _r_o_f_f implementations at the
              same time _g_r_o_f_f provides the facility to prepend a prefix to most
              of  its  programs  that  could provoke name clashings at run time
              (default is to have none).  Historically,  this  prefix  was  the
              character  gg,  but it can be anything.  For example, ggttrrooffff stood
              for _g_r_o_f_f's ttrrooffff, ggttbbll for the _g_r_o_f_f version of ttbbll.  By setting
              GGRROOFFFF__CCOOMMMMAANNDD__PPRREEFFIIXX  to  different  values,  the  different _r_o_f_f
              installations can be addressed.  More exactly, if it  is  set  to
              prefix  _x_x_x  then  ggrrooffff  as  a  wrapper program internally calls
              _x_x_xttrrooffff instead of ttrrooffff.  This also applies to  the  preproces‐
              sors  eeqqnn,  ggrrnn,  ppiicc,  rreeffeerr,  ttbbll, ssooeelliimm, and to the utilities
              iinnddxxbbiibb and llooookkbbiibb.  This feature does not apply to any programs
              different  from  the ones above (most notably ggrrooffff itself) since
              they are unique to the _g_r_o_f_f package.

       GGRROOFFFF__EENNCCOODDIINNGG
              The value of this environment value is passed to the pprreeccoonnvv pre‐
              processor  to  select  the encoding of input files.  Setting this
              option implies ggrrooffff's command line option  --kk  (this  is,  ggrrooffff
              actually  always  calls  pprreeccoonnvv).  If set without a value, ggrrooffff
              calls pprreeccoonnvv without arguments.  An  explicit  --KK  command  line
              option overrides the value of GGRROOFFFF__EENNCCOODDIINNGG.  See pprreeccoonnvv(1) for
              details.

       GGRROOFFFF__FFOONNTT__PPAATTHH
              A list of directories in which to search for the  ddeevv_n_a_m_e  direc‐
              tory   in  addition  to  the  default  ones.   See  ttrrooffff(1)  and
              ggrrooffff__ffoonntt(5) for more details.

       GGRROOFFFF__TTMMAACC__PPAATTHH
              A list of directories in which to search for macro files in addi‐
              tion  to the default directories.  See ttrrooffff(1) and ggrrooffff__ttmmaacc(5)
              for more details.

       GGRROOFFFF__TTMMPPDDIIRR
              The directory in which temporary files are created.  If  this  is
              not  set  but  the environment variable TTMMPPDDIIRR instead, temporary
              files are created in the directory $$TTMMPPDDIIRR.  On MS-DOS  and  Win‐
              dows  32  platforms,  the  environment variables TTMMPP and TTEEMMPP (in
              that order) are searched also,  after  GGRROOFFFF__TTMMPPDDIIRR  and  TTMMPPDDIIRR.
              Otherwise,  temporary  files  are created in //ttmmpp.  The rreeffeerr(1),
              ggrrooffffeerr(1),  ggrroohhttmmll(1),  and  ggrrooppss(1)  commands  use  temporary
              files.

       GGRROOFFFF__TTYYPPEESSEETTTTEERR
              Preset  the  default device.  If this is not set the ppss device is
              used as default.  This device name is overwritten by  the  option
              --TT.

EEXXAAMMPPLLEESS
       The  following  example  illustrates the power of the ggrrooffff program as a
       wrapper around ttrrooffff.

       To process a _r_o_f_f file using the preprocessors ttbbll and ppiicc  and  the  mmee
       macro set, classical _t_r_o_f_f had to be called by

              pic foo.me | tbl | troff -me -Tlatin1 | grotty

       Using ggrrooffff, this pipe can be shortened to the equivalent command

              groff -p -t -me -T latin1 foo.me

       An  even  easier  way  to  call this is to use ggrroogg(1) to guess the pre‐
       processor and macro options and execute the generated command (by  using
       backquotes to specify shell command substitution)

              `grog -Tlatin1 foo.me`

       The simplest way is to view the contents in an automated way by calling

              groffer foo.me

BBUUGGSS
       On  EBCDIC  hosts  (e.g.,  OS/390 Unix), output devices aasscciiii and llaattiinn11
       aren't available.  Similarly, output for EBCDIC code page ccpp11004477 is  not
       available on ASCII based operating systems.

       Report  bugs  to  the groff mailing list ⟨bug-groff@gnu.org⟩.  Include a
       complete, self-contained example that allows the bug to  be  reproduced,
       and say which version of _g_r_o_f_f you are using.

PPOOSSIITTIIOONNSS FFRROOMM IINNSSTTAALLLLAATTIIOONN
       There  are  some  directories  in  which  _g_r_o_f_f installs all of its data
       files.  Due to different installation habits on different operating sys‐
       tems,  their  locations  are not absolutely fixed, but their function is
       clearly defined and coincides on all systems.

   CCoolllleeccttiioonn ooff IInnssttaallllaattiioonn DDiirreeccttoorriieess
       This section describes the position of all files of  the  _g_r_o_f_f  package
       after  the installation — got from MMaakkeeffiillee..ccoommmm at the top of the _g_r_o_f_f
       source package.

       //uussrr//ddiicctt//ppaappeerrss//IInndd
              index directory and index name

       //uussrr//lliibb//ffoonntt
              legacy font directory

       //uussrr//bbiinn
              directory for binary programs

       //uussrr//lliibb//ggrrooffff//ssiittee--ttmmaacc
              system tmac directory

       //uussrr//sshhaarree//ddoocc//ggrrooffff--bbaassee
              documentation directory

       //uussrr//sshhaarree//ddoocc//ggrrooffff--bbaassee//eexxaammpplleess
              directory for examples

       //uussrr//sshhaarree//ddoocc//ggrrooffff--bbaassee//hhttmmll
              documentation directory for html files

       //uussrr//sshhaarree//ddoocc//ggrrooffff--bbaassee//ppddff
              documentation directory for pdf files

       //uussrr//sshhaarree//ggrrooffff//11..2222..33
              data subdirectory

       //uussrr//sshhaarree//ggrrooffff//11..2222..33//eeiiggnn
              file for common words

       //uussrr//sshhaarree//ggrrooffff//11..2222..33//ffoonntt
              directory for fonts

       //uussrr//sshhaarree//ggrrooffff//11..2222..33//oollddffoonntt
              directory for old fonts

       //uussrr//sshhaarree//ggrrooffff//11..2222..33//ttmmaacc
              tmac directory

       //uussrr//sshhaarree//ggrrooffff//11..2222..33//ttmmaacc//mmmm
              mm tmac directory

       //uussrr//sshhaarree//ggrrooffff//ssiittee--ffoonntt
              local font directory

       //uussrr//sshhaarree//ggrrooffff//ssiittee--ttmmaacc
              local tmac directory

   ggrrooffff MMaaccrroo DDiirreeccttoorryy
       This contains all information related to macro packages.  Note that more
       than  a  single  directory  is searched for those files as documented in
       ggrrooffff__ttmmaacc(5).  For the _g_r_o_f_f installation corresponding to  this  docu‐
       ment,  it  is  located  at  _/_u_s_r_/_s_h_a_r_e_/_g_r_o_f_f_/_1_._2_2_._3_/_t_m_a_c.  The following
       files contained in the _g_r_o_f_f _m_a_c_r_o _d_i_r_e_c_t_o_r_y have a special meaning:

       ttrrooffffrrcc
              Initialization file for _t_r_o_f_f.   This  is  interpreted  by  ttrrooffff
              before reading the macro sets and any input.

       ttrrooffffrrcc--eenndd
              Final  startup file for _t_r_o_f_f.  It is parsed after all macro sets
              have been read.

       _n_a_m_e..ttmmaacc
       ttmmaacc.._n_a_m_e
              Macro file for macro package _n_a_m_e.

   ggrrooffff FFoonntt DDiirreeccttoorryy
       This contains all information related to output devices.  Note that more
       than  a single directory is searched for those files; see ttrrooffff(1).  For
       the _g_r_o_f_f installation corresponding to this document, it is located  at
       _/_u_s_r_/_s_h_a_r_e_/_g_r_o_f_f_/_1_._2_2_._3_/_f_o_n_t.   The  following  files  contained  in the
       _g_r_o_f_f _f_o_n_t _d_i_r_e_c_t_o_r_y have a special meaning:

       ddeevv_n_a_m_e//DDEESSCC
              Device description file for device _n_a_m_e, see ggrrooffff__ffoonntt(5).

       ddeevv_n_a_m_e//_F
              Font file for font _F of device _n_a_m_e.

AAVVAAIILLAABBIILLIITTYY
       Information on how to get _g_r_o_f_f and related information is available  at
       the groff GNU website ⟨http://www.gnu.org/software/groff⟩.

       Three _g_r_o_f_f mailing lists are available:

              for reporting bugs ⟨bug-groff@gnu.org⟩.

              for general discussion of _g_r_o_f_f, ⟨groff@gnu.org⟩.

              the  groff  commit list ⟨groff-commit@ffii.org⟩, a read-only list
              showing logs of commitments to the groff repository.

       Details on repository access and much more can  be  found  in  the  file
       RREEAADDMMEE at the top directory of the _g_r_o_f_f source package.

       There  is a free implementation of the ggrraapp preprocessor, written by Ted
       Faber ⟨faber@lunabase.org⟩.  The actual version can be found at the grap
       website  ⟨http://www.lunabase.org/~faber/Vault/software/grap/⟩.  This is
       the only grap version supported by _g_r_o_f_f.

SSEEEE AALLSSOO
       The _g_r_o_f_f _i_n_f_o _f_i_l_e contains all information on the _g_r_o_f_f system within
       a single document, providing many examples and background information.
       See iinnffoo(1) on how to read it.

       Due to its complex structure, the _g_r_o_f_f system has many man pages.  They
       can be read with mmaann(1) or ggrrooffffeerr(1).

       But there are special sections of _m_a_n_-_p_a_g_e_s.  _g_r_o_f_f has man-pages in
       sections 11, 55,aanndd 7..  When there are several _m_a_n_-_p_a_g_e_s with the same
       name in the same _m_a_n section, the one with the lowest section is should
       as first.  The other man-pages can be shown anyway by adding the section
       number as argument before the man-page name.  Reading the man-page about
       the _g_r_o_f_f language is done by one of
              mmaann 77 ggrrooffff
              ggrrooffffeerr 77 ggrrooffff

       Introduction, history and further readings:
              rrooffff(7).

       Viewer for groff files:
              ggrrooffffeerr(1), ggxxddiittvviieeww(1), xxddiittvviieeww(1x).

       Wrapper programs for formatters:
              ggrrooffff(1), ggrroogg(1).

       Roff preprocessors:
              eeqqnn(1), ggrrnn(1), ppiicc(1), cchheemm(1), pprreeccoonnvv(1), rreeffeerr(1), ssooeelliimm(1),
              ttbbll(1), ggrraapp(1).

       Roff language with the groff extensions:
              ggrrooffff(7), ggrrooffff__cchhaarr(7), ggrrooffff__ddiiffff(7), ggrrooffff__ffoonntt(5).

       Roff formatter programs:
              nnrrooffff(1), ttrrooffff(1), ddiittrrooffff(7).

       The intermediate output language:
              ggrrooffff__oouutt(7).

       Postprocessors for the output devices:
              ggrrooddvvii(1), ggrroohhttmmll(1), ggrroollbbpp(1), ggrroolljj44(1), lljj44__ffoonntt(5),
              ggrrooppss(1), ggrrooppddff(1), ggrroottttyy(1).

       Groff macro packages and macro-specific utilities:
              ggrrooffff__ttmmaacc(5), ggrrooffff__mmaann(7), ggrrooffff__mmddoocc(7), ggrrooffff__mmee(7),
              ggrrooffff__mmmm(7), ggrrooffff__mmmmssee(7) (only in Swedish locales),
              ggrrooffff__mmoomm(7), ggrrooffff__mmss(7), ggrrooffff__wwwwww(7), ggrrooffff__ttrraaccee(7),
              mmmmrrooffff(7).

       The following utilities are available:
              aaddddffttiinnffoo(1), aaffmmttooddiitt(1), eeqqnn22ggrraapphh(1), ggddiiffffmmkk(1),
              ggrraapp22ggrraapphh(1), ggrrooffffeerr(1), ggxxddiittvviieeww(1), hhppffttooddiitt(1), iinnddxxbbiibb(1),
              llkkbbiibb(1), llooookkbbiibb(1), ppddffrrooffff(1), ppffbbttooppss(1), ppiicc22ggrraapphh(1),
              ttffmmttooddiitt(1), xxttoottrrooffff(1).

CCOOPPYYIINNGG ((LLIICCEENNSSEE))
       Copyright © 1989-2014 Free Software Foundation, Inc.

       Rewritten in 2002 by Bernd Warken <groff-bernd.warken-72@web.de>

       This document is part of groff, a free GNU software project.

       Permission is granted to copy, distribute and/or modify this document
       under the terms of the GNU Free Documentation License, Version 1.3 or
       any later version published by the Free Software Foundation; with the
       Invariant Sections being the macro definition or .co and .au, with no
       Front-Cover Texts, and with no Back-Cover Texts.

       A copy of the Free Documentation License is included as a file called
       FDL in the main directory of the groff source package.

       It is also available in the internet at the GNU copyleft site ⟨http://
       www.gnu.org/copyleft/fdl.html⟩.

AAUUTTHHOORRSS
       This document is based on the original _g_r_o_f_f man page written by James
       Clark ⟨jjc@jclark.com⟩.  It was rewritten, enhanced, and put under the
       FDL license by Bernd Warken <groff-bernd.warken-72@web.de>.  It is main‐
       tained by Werner Lemberg ⟨wl@gnu.org⟩.

Groff Version 1.22.3            28 January 2016                        GROFF(1)
