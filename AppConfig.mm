#include "AppConfig.h"
#include "PathUtils.h"
#include "PureiGameCore.h"

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
    //  get current or return fails,  lets return the original BASE_DATA_PATH for now til I can figure this out
    
    GET_CURRENT_OR_RETURN(Framework::PathUtils::GetPersonalDataPath() / BASE_DATA_PATH);
    
    auto result =  [[current supportDirectoryPath] fileSystemRepresentation];
    return result;
}

Framework::CConfig::PathType CAppConfig::BuildConfigPath()
{
    auto userPath(GetBasePath());
    Framework::PathUtils::EnsurePathExists(userPath);
    return userPath / CONFIG_FILENAME;
}

