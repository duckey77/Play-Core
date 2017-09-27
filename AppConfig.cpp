#include "AppConfig.h"
#include "PathUtils.h"

#define BASE_DATA_PATH            (L"Play Data Files")
#define CONFIG_FILENAME           (L"config.xml")

CAppConfig::CAppConfig()
: CConfig(BuildConfigPath())
{
    
}

CAppConfig::~CAppConfig()
{
    
}

Framework::CConfig::PathType CAppConfig::GetBasePath()
{
    
    //  need to return
    //      [[self supportDirectoryPath] fileSystemRepresentation]
    
    //  GET_CURRENT_OR_RETURN();
    
    auto result = Framework::PathUtils::GetPersonalDataPath() / BASE_DATA_PATH;
    return result;
}

Framework::CConfig::PathType CAppConfig::BuildConfigPath()
{
    auto userPath(GetBasePath());
    Framework::PathUtils::EnsurePathExists(userPath);
    return userPath / CONFIG_FILENAME;
}

