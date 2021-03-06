-------------------------------------------------------------------------------
-- |
-- Module      :  Network.CURL730
-- Copyright   :  Copyright © 2012-2014 Krzysztof Kardzis
-- License     :  ISC License (MIT/BSD-style, see LICENSE file for details)
-- 
-- Maintainer  :  Krzysztof Kardzis <kkardzis@gmail.com>
-- Stability   :  experimental
-- Portability :  non-portable
--
-- <<http://ga-beacon.appspot.com/UA-53767359-1/hackage/curlhs/CURL730>>
-------------------------------------------------------------------------------

module Network.CURL730
  ( module Network.CURL000

  -- |
  -- Using functions from this module requires an explicit linking
  -- with @libcurl\/7.30@ or newer at program runtime:
  --
  -- > main = withlib CURL730 $ do
  -- >   ...
  --
  -- Without that, any foreign call to @libcurl@ will fail.
  --
  -- More info may be found in the <docs>.


-------------------------------------------------------------------------------
-- * Global interface
-------------------------------------------------------------------------------
 
  -- ** Version info
  , curl_version
  , curl_version_info
  , CURL_version_info (..)
  , CURLfeature
      ( CURL_VERSION_IPV6
      , CURL_VERSION_KERBEROS4
      , CURL_VERSION_SSL
      , CURL_VERSION_LIBZ
      , CURL_VERSION_NTLM
      , CURL_VERSION_GSSNEGOTIATE
      , CURL_VERSION_DEBUG
      , CURL_VERSION_CURLDEBUG
      , CURL_VERSION_ASYNCHDNS
      , CURL_VERSION_SPNEGO
      , CURL_VERSION_LARGEFILE
      , CURL_VERSION_IDN
      , CURL_VERSION_SSPI
      , CURL_VERSION_CONV
      , CURL_VERSION_TLSAUTH_SRP
      , CURL_VERSION_NTLM_WB
      )

-------------------------------------------------------------------------------
-- * Easy interface
-- | See <http://curl.haxx.se/libcurl/c/libcurl-easy.html>
--   for easy interface overview.
-------------------------------------------------------------------------------

  -- ** Init / Cleanup
  , curl_easy_init
  , curl_easy_cleanup
  , curl_easy_reset
  , CURL

  -- ** Transfer
  , curl_easy_perform
  , curl_easy_recv
  , curl_easy_send

  -- ** Get info
  , curl_easy_getinfo
  , CURLinfo
      ( CURLINFO_EFFECTIVE_URL
      , CURLINFO_RESPONSE_CODE
      , CURLINFO_HTTP_CONNECTCODE
      , CURLINFO_FILETIME
      , CURLINFO_TOTAL_TIME
      , CURLINFO_NAMELOOKUP_TIME
      , CURLINFO_CONNECT_TIME
      , CURLINFO_APPCONNECT_TIME
      , CURLINFO_PRETRANSFER_TIME
      , CURLINFO_STARTTRANSFER_TIME
      , CURLINFO_REDIRECT_TIME
      , CURLINFO_REDIRECT_COUNT
      , CURLINFO_REDIRECT_URL
      , CURLINFO_SIZE_UPLOAD
      , CURLINFO_SIZE_DOWNLOAD
      , CURLINFO_SPEED_DOWNLOAD
      , CURLINFO_SPEED_UPLOAD
      , CURLINFO_HEADER_SIZE
      , CURLINFO_REQUEST_SIZE
      , CURLINFO_SSL_VERIFYRESULT
      , CURLINFO_SSL_ENGINES
      , CURLINFO_CONTENT_LENGTH_DOWNLOAD
      , CURLINFO_CONTENT_LENGTH_UPLOAD
      , CURLINFO_CONTENT_TYPE
      , CURLINFO_HTTPAUTH_AVAIL
      , CURLINFO_PROXYAUTH_AVAIL
      , CURLINFO_OS_ERRNO
      , CURLINFO_NUM_CONNECTS
      , CURLINFO_PRIMARY_IP
      , CURLINFO_PRIMARY_PORT
      , CURLINFO_LOCAL_IP
      , CURLINFO_LOCAL_PORT
      , CURLINFO_COOKIELIST
      , CURLINFO_LASTSOCKET
      , CURLINFO_FTP_ENTRY_PATH
      , CURLINFO_CERTINFO
      , CURLINFO_CONDITION_UNMET
      , CURLINFO_RTSP_SESSION_ID
      , CURLINFO_RTSP_CLIENT_CSEQ
      , CURLINFO_RTSP_SERVER_CSEQ
      , CURLINFO_RTSP_CSEQ_RECV
      )

  -- ** Set options
  , curl_easy_setopt
  , CURLoption
      ---- BEHAVIOR OPTIONS ---------------------------------------------------
      ( CURLOPT_VERBOSE
      , CURLOPT_HEADER
      , CURLOPT_NOPROGRESS
      , CURLOPT_NOSIGNAL
      , CURLOPT_WILDCARDMATCH

      ---- CALLBACK OPTIONS ---------------------------------------------------
      , CURLOPT_WRITEFUNCTION
     -- CURLOPT_WRITEDATA
      , CURLOPT_READFUNCTION
     -- CURLOPT_READDATA
     -- CURLOPT_IOCTLFUNCTION
     -- CURLOPT_IOCTLDATA
     -- CURLOPT_SEEKFUNCTION
     -- CURLOPT_SEEKDATA
     -- CURLOPT_SOCKOPTFUNCTION
     -- CURLOPT_SOCKOPTDATA
     -- CURLOPT_OPENSOCKETFUNCTION
     -- CURLOPT_OPENSOCKETDATA
     -- CURLOPT_CLOSESOCKETFUNCTION
     -- CURLOPT_CLOSESOCKETDATA
     -- CURLOPT_PROGRESSFUNCTION
     -- CURLOPT_PROGRESSDATA
     -- CURLOPT_HEADERFUNCTION
     -- CURLOPT_HEADERDATA
     -- CURLOPT_DEBUGFUNCTION
     -- CURLOPT_DEBUGDATA
     -- CURLOPT_SSL_CTX_FUNCTION
     -- CURLOPT_SSL_CTX_DATA
     -- CURLOPT_CONV_TO_NETWORK_FUNCTION
     -- CURLOPT_CONV_FROM_NETWORK_FUNCTION
     -- CURLOPT_CONV_FROM_UTF8_FUNCTION
     -- CURLOPT_INTERLEAVEFUNCTION
     -- CURLOPT_INTERLEAVEDATA
     -- CURLOPT_CHUNK_BGN_FUNCTION
     -- CURLOPT_CHUNK_END_FUNCTION
     -- CURLOPT_CHUNK_DATA
     -- CURLOPT_FNMATCH_FUNCTION
     -- CURLOPT_FNMATCH_DATA

      ---- ERROR OPTIONS ------------------------------------------------------
     -- CURLOPT_ERRORBUFFER
     -- CURLOPT_STDERR
      , CURLOPT_FAILONERROR

      ---- NETWORK OPTIONS ----------------------------------------------------
      , CURLOPT_URL
      , CURLOPT_PROTOCOLS
      , CURLOPT_REDIR_PROTOCOLS
      , CURLOPT_PROXY
      , CURLOPT_PROXYPORT
      , CURLOPT_PROXYTYPE
      , CURLOPT_NOPROXY
      , CURLOPT_HTTPPROXYTUNNEL
      , CURLOPT_SOCKS5_GSSAPI_SERVICE
      , CURLOPT_SOCKS5_GSSAPI_NEC
      , CURLOPT_INTERFACE
      , CURLOPT_LOCALPORT
      , CURLOPT_LOCALPORTRANGE
      , CURLOPT_DNS_CACHE_TIMEOUT
     -- CURLOPT_DNS_USE_GLOBAL_CACHE
      , CURLOPT_BUFFERSIZE
      , CURLOPT_PORT
      , CURLOPT_TCP_NODELAY
      , CURLOPT_ADDRESS_SCOPE
      , CURLOPT_TCP_KEEPALIVE
      , CURLOPT_TCP_KEEPIDLE
      , CURLOPT_TCP_KEEPINTVL

      ---- NAMES and PASSWORDS OPTIONS (Authentication) -----------------------
      , CURLOPT_NETRC
      , CURLOPT_NETRC_FILE
      , CURLOPT_USERPWD
      , CURLOPT_PROXYUSERPWD
      , CURLOPT_USERNAME
      , CURLOPT_PASSWORD
      , CURLOPT_PROXYUSERNAME
      , CURLOPT_PROXYPASSWORD
      , CURLOPT_HTTPAUTH
      , CURLOPT_TLSAUTH_TYPE
      , CURLOPT_TLSAUTH_USERNAME
      , CURLOPT_TLSAUTH_PASSWORD
      , CURLOPT_PROXYAUTH

      ---- HTTP OPTIONS -------------------------------------------------------
      , CURLOPT_AUTOREFERER
      , CURLOPT_ACCEPT_ENCODING
      , CURLOPT_TRANSFER_ENCODING
      , CURLOPT_FOLLOWLOCATION
      , CURLOPT_UNRESTRICTED_AUTH
      , CURLOPT_MAXREDIRS
      , CURLOPT_POSTREDIR
      , CURLOPT_PUT
      , CURLOPT_POST
     -- CURLOPT_POSTFIELDS
      , CURLOPT_POSTFIELDSIZE
      , CURLOPT_POSTFIELDSIZE_LARGE
      , CURLOPT_COPYPOSTFIELDS
     -- CURLOPT_HTTPPOST
      , CURLOPT_REFERER
      , CURLOPT_USERAGENT
      , CURLOPT_HTTPHEADER
      , CURLOPT_HTTP200ALIASES
      , CURLOPT_COOKIE
      , CURLOPT_COOKIEFILE
      , CURLOPT_COOKIEJAR
      , CURLOPT_COOKIESESSION
      , CURLOPT_COOKIELIST
      , CURLOPT_HTTPGET
      , CURLOPT_HTTP_VERSION
      , CURLOPT_IGNORE_CONTENT_LENGTH
      , CURLOPT_HTTP_CONTENT_DECODING
      , CURLOPT_HTTP_TRANSFER_DECODING

      ---- SMTP OPTIONS -------------------------------------------------------
      , CURLOPT_MAIL_FROM
      , CURLOPT_MAIL_RCPT
      , CURLOPT_MAIL_AUTH

      ---- TFTP OPTIONS -------------------------------------------------------
      , CURLOPT_TFTP_BLKSIZE

      ---- FTP OPTIONS --------------------------------------------------------
      , CURLOPT_FTPPORT
      , CURLOPT_QUOTE
      , CURLOPT_POSTQUOTE
      , CURLOPT_PREQUOTE
      , CURLOPT_DIRLISTONLY
      , CURLOPT_APPEND
      , CURLOPT_FTP_USE_EPRT
      , CURLOPT_FTP_USE_EPSV
      , CURLOPT_FTP_USE_PRET
      , CURLOPT_FTP_CREATE_MISSING_DIRS
      , CURLOPT_FTP_RESPONSE_TIMEOUT
      , CURLOPT_FTP_ALTERNATIVE_TO_USER
      , CURLOPT_FTP_SKIP_PASV_IP
      , CURLOPT_FTPSSLAUTH
      , CURLOPT_FTP_SSL_CCC
      , CURLOPT_FTP_ACCOUNT
      , CURLOPT_FTP_FILEMETHOD

      ---- RTSP OPTIONS -------------------------------------------------------
      , CURLOPT_RTSP_REQUEST
      , CURLOPT_RTSP_SESSION_ID
      , CURLOPT_RTSP_STREAM_URI
      , CURLOPT_RTSP_TRANSPORT
      , CURLOPT_RTSP_HEADER
      , CURLOPT_RTSP_CLIENT_CSEQ
      , CURLOPT_RTSP_SERVER_CSEQ

      ---- PROTOCOL OPTIONS ---------------------------------------------------
      , CURLOPT_TRANSFERTEXT
      , CURLOPT_PROXY_TRANSFER_MODE
      , CURLOPT_CRLF
      , CURLOPT_RANGE
      , CURLOPT_RESUME_FROM
      , CURLOPT_RESUME_FROM_LARGE
      , CURLOPT_CUSTOMREQUEST
      , CURLOPT_FILETIME
      , CURLOPT_NOBODY
      , CURLOPT_INFILESIZE
      , CURLOPT_INFILESIZE_LARGE
      , CURLOPT_UPLOAD
      , CURLOPT_MAXFILESIZE
      , CURLOPT_MAXFILESIZE_LARGE
      , CURLOPT_TIMECONDITION
      , CURLOPT_TIMEVALUE

      ---- CONNECTION OPTIONS -------------------------------------------------
      , CURLOPT_TIMEOUT
      , CURLOPT_TIMEOUT_MS
      , CURLOPT_LOW_SPEED_LIMIT
      , CURLOPT_LOW_SPEED_TIME
      , CURLOPT_MAX_SEND_SPEED_LARGE
      , CURLOPT_MAX_RECV_SPEED_LARGE
      , CURLOPT_MAXCONNECTS
     -- CURLOPT_CLOSEPOLICY
      , CURLOPT_FRESH_CONNECT
      , CURLOPT_FORBID_REUSE
      , CURLOPT_CONNECTTIMEOUT
      , CURLOPT_CONNECTTIMEOUT_MS
      , CURLOPT_IPRESOLVE
      , CURLOPT_CONNECT_ONLY
      , CURLOPT_USE_SSL
      , CURLOPT_RESOLVE
      , CURLOPT_DNS_SERVERS
      , CURLOPT_ACCEPTTIMEOUT_MS

      ---- SSL and SECURITY OPTIONS -------------------------------------------
      , CURLOPT_SSLCERT
      , CURLOPT_SSLCERTTYPE
      , CURLOPT_SSLKEY
      , CURLOPT_SSLKEYTYPE
      , CURLOPT_KEYPASSWD
      , CURLOPT_SSLENGINE
      , CURLOPT_SSLENGINE_DEFAULT
      , CURLOPT_SSLVERSION
      , CURLOPT_SSL_VERIFYPEER
      , CURLOPT_CAINFO
      , CURLOPT_ISSUERCERT
      , CURLOPT_CAPATH
      , CURLOPT_CRLFILE
      , CURLOPT_SSL_VERIFYHOST
      , CURLOPT_CERTINFO
      , CURLOPT_RANDOM_FILE
      , CURLOPT_EGDSOCKET
      , CURLOPT_SSL_CIPHER_LIST
      , CURLOPT_SSL_SESSIONID_CACHE
      , CURLOPT_SSL_OPTIONS
      , CURLOPT_KRBLEVEL
      , CURLOPT_GSSAPI_DELEGATION

      ---- SSH OPTIONS --------------------------------------------------------
      , CURLOPT_SSH_AUTH_TYPES
      , CURLOPT_SSH_HOST_PUBLIC_KEY_MD5
      , CURLOPT_SSH_PUBLIC_KEYFILE
      , CURLOPT_SSH_PRIVATE_KEYFILE
      , CURLOPT_SSH_KNOWNHOSTS
     -- CURLOPT_SSH_KEYFUNCTION
     -- CURLOPT_SSH_KEYDATA

      ---- OTHER OPTIONS ------------------------------------------------------
     -- CURLOPT_PRIVATE
      , CURLOPT_SHARE
      , CURLOPT_NEW_FILE_PERMS
      , CURLOPT_NEW_DIRECTORY_PERMS

      ---- TELNET OPTIONS -----------------------------------------------------
      , CURLOPT_TELNETOPTIONS
      )

  -- *** Callbacks
  , CURL_write_callback, CURL_write_response (..)
  , CURL_read_callback , CURL_read_response  (..)

  -- *** Constants
  , CURLproto
      ( CURLPROTO_ALL
      , CURLPROTO_HTTP
      , CURLPROTO_HTTPS
      , CURLPROTO_FTP
      , CURLPROTO_FTPS
      , CURLPROTO_SCP
      , CURLPROTO_SFTP
      , CURLPROTO_TELNET
      , CURLPROTO_LDAP
      , CURLPROTO_LDAPS
      , CURLPROTO_DICT
      , CURLPROTO_FILE
      , CURLPROTO_TFTP
      , CURLPROTO_IMAP
      , CURLPROTO_IMAPS
      , CURLPROTO_POP3
      , CURLPROTO_POP3S
      , CURLPROTO_SMTP
      , CURLPROTO_SMTPS
      , CURLPROTO_RTSP
      , CURLPROTO_RTMP
      , CURLPROTO_RTMPT
      , CURLPROTO_RTMPE
      , CURLPROTO_RTMPTE
      , CURLPROTO_RTMPS
      , CURLPROTO_RTMPTS
      , CURLPROTO_GOPHER
      )

  , CURLproxy
      ( CURLPROXY_HTTP
      , CURLPROXY_HTTP_1_0
      , CURLPROXY_SOCKS4
      , CURLPROXY_SOCKS5
      , CURLPROXY_SOCKS4A
      , CURLPROXY_SOCKS5_HOSTNAME
      )

  , CURLnetrc
      ( CURL_NETRC_IGNORED
      , CURL_NETRC_OPTIONAL
      , CURL_NETRC_REQUIRED
      )

  , CURLauth
      ( CURLAUTH_BASIC
      , CURLAUTH_DIGEST
      , CURLAUTH_DIGEST_IE
      , CURLAUTH_GSSNEGOTIATE
      , CURLAUTH_NTLM
      , CURLAUTH_NTLM_WB
      , CURLAUTH_ONLY
      , CURLAUTH_ANY
      , CURLAUTH_ANYSAFE
      )

  , CURLtlsauth
      ( CURL_TLSAUTH_SRP
      )

  , CURLredir
      ( CURL_REDIR_GET_ALL
      , CURL_REDIR_POST_301
      , CURL_REDIR_POST_302
      , CURL_REDIR_POST_303
      , CURL_REDIR_POST_ALL
      )

  , CURLhttpver
      ( CURL_HTTP_VERSION_NONE
      , CURL_HTTP_VERSION_1_0
      , CURL_HTTP_VERSION_1_1
      )

  , CURLftpcreate
      ( CURLFTP_CREATE_DIR_NONE
      , CURLFTP_CREATE_DIR
      , CURLFTP_CREATE_DIR_RETRY
      )

  , CURLftpauth
      ( CURLFTPAUTH_DEFAULT
      , CURLFTPAUTH_SSL
      , CURLFTPAUTH_TLS
      )

  , CURLftpssl
      ( CURLFTPSSL_CCC_NONE
      , CURLFTPSSL_CCC_PASSIVE
      , CURLFTPSSL_CCC_ACTIVE
      )

  , CURLftpmethod
      ( CURLFTPMETHOD_DEFAULT
      , CURLFTPMETHOD_MULTICWD
      , CURLFTPMETHOD_NOCWD
      , CURLFTPMETHOD_SINGLECWD
      )

  , CURLrtspreq
      ( CURL_RTSPREQ_OPTIONS
      , CURL_RTSPREQ_DESCRIBE
      , CURL_RTSPREQ_ANNOUNCE
      , CURL_RTSPREQ_SETUP
      , CURL_RTSPREQ_PLAY
      , CURL_RTSPREQ_PAUSE
      , CURL_RTSPREQ_TEARDOWN
      , CURL_RTSPREQ_GET_PARAMETER
      , CURL_RTSPREQ_SET_PARAMETER
      , CURL_RTSPREQ_RECORD
      , CURL_RTSPREQ_RECEIVE
      )

  , CURLtimecond
      ( CURL_TIMECOND_NONE
      , CURL_TIMECOND_IFMODSINCE
      , CURL_TIMECOND_IFUNMODSINCE
      , CURL_TIMECOND_LASTMOD
      )

  , CURLipresolve
      ( CURL_IPRESOLVE_WHATEVER
      , CURL_IPRESOLVE_V4
      , CURL_IPRESOLVE_V6
      )

  , CURLusessl
      ( CURLUSESSL_NONE
      , CURLUSESSL_TRY
      , CURLUSESSL_CONTROL
      , CURLUSESSL_ALL
      )

  , CURLsslver
      ( CURL_SSLVERSION_DEFAULT
      , CURL_SSLVERSION_TLSv1
      , CURL_SSLVERSION_SSLv2
      , CURL_SSLVERSION_SSLv3
      )

  , CURLsslopt
      ( CURLSSLOPT_ALLOW_BEAST
      )

  , CURLgssapi
      ( CURLGSSAPI_DELEGATION_NONE
      , CURLGSSAPI_DELEGATION_POLICY_FLAG
      , CURLGSSAPI_DELEGATION_FLAG
      )

  , CURLsshauth
      ( CURLSSH_AUTH_ANY
      , CURLSSH_AUTH_NONE
      , CURLSSH_AUTH_PUBLICKEY
      , CURLSSH_AUTH_PASSWORD
      , CURLSSH_AUTH_HOST
      , CURLSSH_AUTH_KEYBOARD
      , CURLSSH_AUTH_AGENT
      , CURLSSH_AUTH_DEFAULT
      )

  -- ** Exceptions
  -- | More about error codes in libcurl on
  --   <http://curl.haxx.se/libcurl/c/libcurl-errors.html>
  , CURLE (..)
  , CURLC (..)


-------------------------------------------------------------------------------
-- * Multi interface
-- | See <http://curl.haxx.se/libcurl/c/libcurl-multi.html>
--   for multi interface overview.
-------------------------------------------------------------------------------
-- | TODO


-------------------------------------------------------------------------------
-- * Share interface
-- | See <http://curl.haxx.se/libcurl/c/libcurl-share.html>
--   for share interface overview.
-------------------------------------------------------------------------------

  -- ** Init / Cleanup
  , curl_share_init
  , curl_share_cleanup
  , CURLSH

  -- ** Set options
  , curl_share_setopt
  , CURLSHoption
      ( CURLSHOPT_SHARE
      , CURLSHOPT_UNSHARE
      )

  , CURLSHlockdata
      ( CURL_LOCK_DATA_COOKIE
      , CURL_LOCK_DATA_DNS
      , CURL_LOCK_DATA_SSL_SESSION
      )

  -- ** Exceptions
  -- | More about error codes in libcurl on
  --   <http://curl.haxx.se/libcurl/c/libcurl-errors.html>
  , CURLSHE (..)
  , CURLSHC (..)


  ) where

import Network.CURL000.LibHS
import Network.CURL000.Types
import Network.CURL000

