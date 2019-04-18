{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Kulitta (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [2,2,2] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/christophersherrod/Library/Haskell/bin"
libdir     = "/Users/christophersherrod/Library/Haskell/ghc-8.6.3-x86_64/lib/Kulitta-2.2.2"
dynlibdir  = "/Users/christophersherrod/Library/Haskell/ghc-8.6.3-x86_64/lib/x86_64-osx-ghc-8.6.3"
datadir    = "/Users/christophersherrod/Library/Haskell/share/ghc-8.6.3-x86_64/Kulitta-2.2.2"
libexecdir = "/Users/christophersherrod/Library/Haskell/libexec/x86_64-osx-ghc-8.6.3/Kulitta-2.2.2"
sysconfdir = "/Users/christophersherrod/Library/Haskell/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Kulitta_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Kulitta_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Kulitta_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Kulitta_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Kulitta_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Kulitta_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
