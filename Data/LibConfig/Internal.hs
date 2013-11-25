{-
Libconfig bindings for Haskell
Copyright (c) 2013 Camber Corporation

libconfig-haskell is free software: you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your option)
any later version.

libconfig-haskell is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License
for more details.

You should have received a copy of the GNU Lesser General Public License along
with libconfig-haskell.  If not, see <http://www.gnu.org/licenses/>.
-}

{-# LANGUAGE ForeignFunctionInterface #-}

module Data.LibConfig.Internal where
import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String

data C_LibconfigCfg = C_LibconfigCfg
data C_LibconfigSetting = C_LibconfigSetting
type C_LibconfigHandle = Ptr C_LibconfigCfg
type C_LibconfigSettingHandle = Ptr C_LibconfigSetting
type C_LibconfigStatus = CInt
type C_LibconfigSettingFormat = CShort
type C_LibconfigConfigTYpe = CInt

-- Libconfig boolean values
c_libConfigStatusTRUE  = 1 :: CInt
c_libConfigStatusFALSE = 0 :: CInt

-- Config Type values
c_libConfigTypeNONE   = 0 :: CInt
c_libConfigTypeGROUP  = 1 :: CInt
c_libConfigTypeINT    = 2 :: CInt
c_libConfigTypeINT64  = 3 :: CInt
c_libConfigTypeFLOAT  = 4 :: CInt
c_libConfigTypeSTRING = 5 :: CInt
c_libConfigTypeBOOL   = 6 :: CInt
c_libConfigTypeARRAY  = 7 :: CInt
c_libConfigTypeLIST   = 8 :: CInt

foreign import ccall "config_init" c_libConfigInit ::
    C_LibconfigHandle
    -> IO ()

foreign import ccall "config_destroy" c_libConfigDestroy ::
    C_LibconfigHandle
    -> IO ()

foreign import ccall "config_read" c_libConfigRead ::
    C_LibconfigHandle
    -> Ptr CFile
    -> IO C_LibconfigStatus

foreign import ccall "config_read_file" c_libConfigReadFile ::
    C_LibconfigHandle
    -> CString 
    -> IO C_LibconfigStatus

foreign import ccall "config_read_string" c_libConfigReadString ::
    C_LibconfigHandle 
    -> CString 
    -> IO C_LibconfigStatus

foreign import ccall "config_write" c_libConfigWrite ::
    C_LibconfigHandle
    -> Ptr CFile
    -> IO ()

foreign import ccall "config_write_file" c_libConfigWriteFile ::
    C_LibconfigHandle
    -> CString
    -> IO C_LibconfigStatus

foreign import ccall "config_lookup_int" c_libConfigLookupInt ::
    C_LibconfigHandle
    -> CString
    -> Ptr CInt
    -> IO C_LibconfigStatus

foreign import ccall "config_lookup_int64" c_libConfigLookupInt64 ::
    C_LibconfigHandle
    -> CString
    -> Ptr CLLong
    -> IO C_LibconfigStatus

foreign import ccall "config_lookup_float" c_libConfigLookupFloat ::
    C_LibconfigHandle
    -> CString
    -> Ptr CDouble
    -> IO C_LibconfigStatus

foreign import ccall "config_lookup_bool" c_libConfigLookupBool ::
    C_LibconfigHandle
    -> CString
    -> Ptr CInt
    -> IO C_LibconfigStatus

foreign import ccall "config_lookup" c_libConfigLookup ::
    C_LibconfigHandle
    -> CString
    -> IO C_LibconfigSettingHandle

foreign import ccall "config_setting_get_int" c_libConfigSettingGetInt ::
    C_LibconfigSettingHandle
    -> IO CInt

foreign import ccall "config_setting_get_int64" c_libConfigSettingGetInt64 ::
    C_LibconfigSettingHandle
    -> IO CLLong

foreign import ccall "config_setting_get_float" c_libConfigSettingGetFloat ::
    C_LibconfigSettingHandle
    -> IO CDouble

foreign import ccall "config_setting_get_bool" c_libConfigSettingGetBool ::
    C_LibconfigSettingHandle
    -> IO CInt

foreign import ccall "config_setting_get_string" c_libConfigSettingGetString ::
    C_LibconfigSettingHandle
    -> IO CString

foreign import ccall "config_setting_set_int" c_libConfigSettingSetInt ::
    C_LibconfigSettingHandle
    -> CInt
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_set_int64" c_libConfigSettingSetInt64 ::
    C_LibconfigSettingHandle
    -> CLLong
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_set_float" c_libConfigSettingSetFloat ::
    C_LibconfigSettingHandle
    -> CDouble
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_set_bool" c_libConfigSettingSetBool ::
    C_LibconfigSettingHandle
    -> CInt
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_set_string" c_libConfigSettingSetString ::
    C_LibconfigSettingHandle
    -> CString
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_lookup_int" c_libConfigSettingLookupInt ::
    C_LibconfigSettingHandle
    -> CString
    -> Ptr CInt
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_lookup_int64" c_libConfigSettingLookupInt64 ::
    C_LibconfigSettingHandle
    -> CString
    -> Ptr CLLong
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_lookup_float" c_libConfigSettingLookupFloat ::
    C_LibconfigSettingHandle
    -> CString
    -> Ptr CDouble
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_lookup_bool" c_libConfigSettingLookupBool ::
    C_LibconfigSettingHandle
    -> CString
    -> Ptr CInt
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_lookup_string" c_libConfigSettingLookupString ::
    C_LibconfigSettingHandle
    -> CString
    -> Ptr CString
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_get_format" c_libConfigSettingGetFormat ::
    C_LibconfigSettingHandle
    -> IO C_LibconfigSettingFormat

foreign import ccall "config_setting_set_format" c_libConfigSettingSetFormat ::
    C_LibconfigSettingHandle
    -> C_LibconfigSettingFormat
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_get_member" c_libConfigSettingGetMember ::
    C_LibconfigSettingHandle
    -> CString
    -> IO C_LibconfigSettingHandle

foreign import ccall "config_setting_get_elem" c_libConfigSettingGetElem ::
    C_LibconfigSettingHandle
    -> CUInt
    -> IO C_LibconfigSettingHandle

foreign import ccall "config_setting_get_int_elem" c_ConfigSettingGetIntElem ::
    C_LibconfigSettingHandle
    -> CInt
    -> IO CInt 

foreign import ccall "config_setting_get_int64_elem" c_ConfigSettingGetInt64Elem ::
    C_LibconfigSettingHandle
    -> CInt
    -> IO CLLong 

foreign import ccall "config_setting_get_float_elem" c_ConfigSettingGetFloatElem ::
    C_LibconfigSettingHandle
    -> CInt
    -> IO CDouble 

foreign import ccall "config_setting_get_bool_elem" c_ConfigSettingGetBoolElem ::
    C_LibconfigSettingHandle
    -> CInt
    -> IO CInt 

foreign import ccall "config_setting_get_string_elem" c_ConfigSettingGetStringElem ::
    C_LibconfigSettingHandle
    -> CInt
    -> IO CString

foreign import ccall "config_setting_set_int_elem" c_ConfigSettingSetIntElem ::
    C_LibconfigSettingHandle
    -> CInt
    -> CInt
    -> IO C_LibconfigSettingHandle

foreign import ccall "config_setting_set_int64_elem" c_ConfigSettingSetInt64Elem ::
    C_LibconfigSettingHandle
    -> CInt
    -> CLLong
    -> IO C_LibconfigSettingHandle

foreign import ccall "config_setting_set_float_elem" c_ConfigSettingSetFloatElem ::
    C_LibconfigSettingHandle
    -> CInt
    -> CDouble
    -> IO C_LibconfigSettingHandle

foreign import ccall "config_setting_set_bool_elem" c_ConfigSettingSetBoolElem ::
    C_LibconfigSettingHandle
    -> CInt
    -> CInt
    -> IO C_LibconfigSettingHandle

foreign import ccall "config_setting_set_string_elem" c_ConfigSettingSetStringElem ::
    C_LibconfigSettingHandle
    -> CInt
    -> CString
    -> IO C_LibconfigSettingHandle

foreign import ccall "config_setting_add" c_ConfigSettingAdd ::
    C_LibconfigSettingHandle
    -> CString
    -> IO C_LibconfigSettingHandle

foreign import ccall "config_setting_remove" c_ConfigSettingRemove ::
    C_LibconfigSettingHandle
    -> CString
    -> IO C_LibconfigStatus

foreign import ccall "config_setting_remove_elem" c_ConfigSettingRemoveElem ::
    C_LibconfigSettingHandle
    -> CUInt
    -> IO C_LibconfigStatus 

-- Only supported by libconfig >= 1.4.9, which is not available in Wheezy

-- foreign import ccall "config_root_setting" c_ConfigRootSetting ::
--     C_LibconfigHandle
--     -> IO C_LibconfigSettingHandle
-- 
-- foreign import ccall "config_setting_name" c_ConfigSettingName ::
--     C_LibconfigSettingHandle
--     -> IO CString
-- 
-- foreign import ccall "config_setting_parent" c_ConfigSettingParent ::
--     C_LibconfigSettingHandle
--     -> IO C_LibconfigSettingHandle
-- 
-- foreign import ccall "config_setting_is_root" c_ConfigSettingIsRoot ::
--     C_LibconfigSettingHandle
--     -> IO CInt
-- 
-- foreign import ccall "config_setting_index" c_ConfigSettingIndex ::
--     C_LibconfigSettingHandle
--     -> IO CInt
-- 
-- foreign import ccall "config_setting_length" c_ConfigSettingLength ::
--     C_LibconfigSettingHandle
--     -> IO CInt
-- 
-- foreign import ccall "config_setting_type" c_ConfigSettingType ::
--     C_LibconfigSettingHandle
--     -> IO CInt
-- 
-- foreign import ccall "config_setting_is_group" c_ConfigSettingIsGroup ::
--     C_LibconfigSettingHandle
--     -> IO C_LibconfigStatus
-- 
-- foreign import ccall "config_setting_is_array" c_ConfigSettingIsArray ::
--     C_LibconfigSettingHandle
--     -> IO C_LibconfigStatus
-- 
-- foreign import ccall "config_setting_is_list" c_ConfigSettingIsList ::
--     C_LibconfigSettingHandle
--     -> IO C_LibconfigStatus
-- 
-- foreign import ccall "config_setting_is_aggregate" c_ConfigSettingIsAggregate ::
--     C_LibconfigSettingHandle
--     -> IO C_LibconfigStatus
-- 
-- foreign import ccall "config_setting_is_scalar" c_ConfigSettingIsScalar ::
--     C_LibconfigSettingHandle
--     -> IO C_LibconfigStatus
-- 
-- foreign import ccall "config_setting_is_number" c_ConfigSettingIsNumber ::
--     C_LibconfigSettingHandle
--     -> IO C_LibconfigStatus
-- 
-- foreign import ccall "config_setting_source_file" c_ConfigSettingSourceFile ::
--     C_LibconfigSettingHandle
--     -> IO CString
-- 
-- foreign import ccall "config_setting_source_line" c_ConfigSettingSourceLine ::
--     C_LibconfigSettingHandle
--     -> IO CUInt
-- 
-- foreign import ccall "config_setting_set_hook" c_ConfigSettingSetHook ::
--     C_LibconfigSettingHandle
--     -> Ptr a
--     -> IO ()
-- 
-- foreign import ccall "config_setting_get_hook" c_ConfigSettingGetHook ::
--     C_LibconfigSettingHandle
--     -> IO (Ptr a)
