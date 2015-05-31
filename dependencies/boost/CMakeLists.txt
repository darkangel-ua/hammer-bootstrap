project(boost.all)

file(GLOB system_src ./1.40.0/libs/system/src/*.cpp)
file(GLOB date_time_src ./1.40.0/libs/date_time/src/gregorian/*.cpp)
file(GLOB program_options_src ./1.40.0/libs/program_options/src/*.cpp)
file(GLOB filesystem_src ./1.40.0/libs/filesystem/src/*.cpp)
file(GLOB thread_src ./1.40.0/libs/thread/src/*.cpp)
file(GLOB thread_pthread_src ./1.40.0/libs/thread/src/pthread/*.cpp)
file(GLOB regex_src ./1.40.0/libs/regex/src/*.cpp)
file(GLOB iostreams_src ./1.40.0/libs/iostreams/src/mapped_file.cpp)
set(serialization_src
    ./1.40.0/libs/serialization/src/basic_iarchive.cpp
    ./1.40.0/libs/serialization/src/basic_archive.cpp
    ./1.40.0/libs/serialization/src/basic_iserializer.cpp
    ./1.40.0/libs/serialization/src/basic_oarchive.cpp
    ./1.40.0/libs/serialization/src/basic_oserializer.cpp
    ./1.40.0/libs/serialization/src/basic_pointer_iserializer.cpp
    ./1.40.0/libs/serialization/src/basic_pointer_oserializer.cpp
    ./1.40.0/libs/serialization/src/basic_serializer_map.cpp
    ./1.40.0/libs/serialization/src/basic_text_iprimitive.cpp
    ./1.40.0/libs/serialization/src/basic_text_oprimitive.cpp
    ./1.40.0/libs/serialization/src/basic_xml_archive.cpp
    ./1.40.0/libs/serialization/src/binary_iarchive.cpp
    ./1.40.0/libs/serialization/src/binary_oarchive.cpp
    ./1.40.0/libs/serialization/src/extended_type_info.cpp
    ./1.40.0/libs/serialization/src/extended_type_info_typeid.cpp
    ./1.40.0/libs/serialization/src/extended_type_info_no_rtti.cpp
    ./1.40.0/libs/serialization/src/polymorphic_iarchive.cpp
    ./1.40.0/libs/serialization/src/polymorphic_oarchive.cpp
    ./1.40.0/libs/serialization/src/stl_port.cpp
    ./1.40.0/libs/serialization/src/text_iarchive.cpp
    ./1.40.0/libs/serialization/src/text_oarchive.cpp
    ./1.40.0/libs/serialization/src/void_cast.cpp
    ./1.40.0/libs/serialization/src/xml_grammar.cpp
    ./1.40.0/libs/serialization/src/xml_iarchive.cpp
    ./1.40.0/libs/serialization/src/xml_oarchive.cpp
    )
#set(serialization_src ${serialization_tmp_sources})
#file(GLOB iostreams_src ./1.40.0/libs/iostreams/src/mapped_file.cpp)

add_library(boost.all STATIC ${system_src} ${date_time_src} ${program_options_src} ${filesystem_src} ${thread_src} ${thread_pthread_src} ${regex_src} ${iostreams_src} ${serialization_src})
target_compile_definitions(boost.all PRIVATE "BOOST_SYSTEM_STATIC_LINK=1 BOOST_DATE_TIME_STATIC_LINK BOOST_All_STATIC_LINK=1 BOOST_THREAD_BUILD_LIB=1")
target_include_directories(boost.all PUBLIC ./1.40.0)

add_subdirectory(crypto)
add_subdirectory(guid)
add_subdirectory(process)
