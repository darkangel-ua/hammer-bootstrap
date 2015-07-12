project(boost.all)

file(GLOB system_src ./boost_1_58_0/libs/system/src/*.cpp)
file(GLOB date_time_src ./boost_1_58_0/libs/date_time/src/gregorian/*.cpp)
file(GLOB program_options_src ./boost_1_58_0/libs/program_options/src/*.cpp)
file(GLOB filesystem_src ./boost_1_58_0/libs/filesystem/src/*.cpp)

file(GLOB thread_src ./boost_1_58_0/libs/thread/src/*.cpp)
IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	file(GLOB thread_os_src ./boost_1_58_0/libs/thread/src/pthread/*.cpp)
ELSE(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	file(GLOB thread_os_src ./boost_1_58_0/libs/thread/src/win32/*.cpp)
ENDIF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")

file(GLOB regex_src ./boost_1_58_0/libs/regex/src/*.cpp)
file(GLOB iostreams_src ./boost_1_58_0/libs/iostreams/src/mapped_file.cpp)
set(serialization_src
    ./boost_1_58_0/libs/serialization/src/basic_iarchive.cpp
    ./boost_1_58_0/libs/serialization/src/basic_archive.cpp
    ./boost_1_58_0/libs/serialization/src/basic_iserializer.cpp
    ./boost_1_58_0/libs/serialization/src/basic_oarchive.cpp
    ./boost_1_58_0/libs/serialization/src/basic_oserializer.cpp
    ./boost_1_58_0/libs/serialization/src/basic_pointer_iserializer.cpp
    ./boost_1_58_0/libs/serialization/src/basic_pointer_oserializer.cpp
    ./boost_1_58_0/libs/serialization/src/basic_serializer_map.cpp
    ./boost_1_58_0/libs/serialization/src/basic_text_iprimitive.cpp
    ./boost_1_58_0/libs/serialization/src/basic_text_oprimitive.cpp
    ./boost_1_58_0/libs/serialization/src/basic_xml_archive.cpp
    ./boost_1_58_0/libs/serialization/src/binary_iarchive.cpp
    ./boost_1_58_0/libs/serialization/src/binary_oarchive.cpp
    ./boost_1_58_0/libs/serialization/src/extended_type_info.cpp
    ./boost_1_58_0/libs/serialization/src/extended_type_info_typeid.cpp
    ./boost_1_58_0/libs/serialization/src/extended_type_info_no_rtti.cpp
    ./boost_1_58_0/libs/serialization/src/polymorphic_iarchive.cpp
    ./boost_1_58_0/libs/serialization/src/polymorphic_oarchive.cpp
    ./boost_1_58_0/libs/serialization/src/stl_port.cpp
    ./boost_1_58_0/libs/serialization/src/text_iarchive.cpp
    ./boost_1_58_0/libs/serialization/src/text_oarchive.cpp
    ./boost_1_58_0/libs/serialization/src/void_cast.cpp
    ./boost_1_58_0/libs/serialization/src/archive_exception.cpp
    ./boost_1_58_0/libs/serialization/src/xml_grammar.cpp
    ./boost_1_58_0/libs/serialization/src/xml_iarchive.cpp
    ./boost_1_58_0/libs/serialization/src/xml_oarchive.cpp
    ./boost_1_58_0/libs/serialization/src/xml_archive_exception.cpp
    )
#set(serialization_src ${serialization_tmp_sources})
#file(GLOB iostreams_src ./boost_1_58_0/libs/iostreams/src/mapped_file.cpp)

add_library(boost.all STATIC ${system_src} ${date_time_src} ${program_options_src} ${filesystem_src} ${thread_src} ${thread_os_src} ${regex_src} ${iostreams_src} ${serialization_src})
target_compile_definitions(boost.all PUBLIC BOOST_SYSTEM_STATIC_LINK=1 BOOST_DATE_TIME_STATIC_LINK BOOST_All_STATIC_LINK=1 BOOST_THREAD_BUILD_LIB=1 BOOST_ALL_NO_LIB=1)
target_include_directories(boost.all PUBLIC ./boost_1_58_0)

IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
	target_link_libraries(boost.all pthread)
ENDIF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")

add_subdirectory(crypto)
add_subdirectory(guid)
add_subdirectory(process)
