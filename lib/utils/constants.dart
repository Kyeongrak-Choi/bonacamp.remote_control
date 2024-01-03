/*
  System
 */

const APP_NAME = 'Admin Manager';
const COPY_RIGHT = 'Copyright 2024. BONACAMP All rights reserved.';

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
  Route
 */

const ROUTE_LOGIN = '/login';
const ROUTE_AUTH = '/auth';

/*
  Util
 */

// Snack Bar Type
enum SNACK_TYPE { INFO, ERROR, ALARM }

// Dialog Type
enum DIALOG_TYPE { SELECT, MSG, NOTICE } // SELECT : yes & no select

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
  Netwrok Config
*/
const CONNECT_TIMEOUT = 120;
const RECEIVE_TIMEOUT = 120;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 APIs
*/
const API_SERVER_CODE = 'DJWRLDPN0U'; // 디오니소스 ERP MOBILE 경영관리 데이터 서버 코드값
const API_REQ_GET = 'GET';
const API_REQ_POST = 'POST';

const API_SYSTEM_LOGIN = '/v1/account/sign-in';
const API_SYSTEM_MASTER = '/v1/clients/';
const API_SYSTEM_EMPLOYEES = '/employees';
const API_SYSTEM_BRANCHES = '/branches';
const API_SYSTEM_TEAMS = '/teams';
const API_SYSTEM_WAREHOUSES = '/warehouses';
const API_SYSTEM_COMMON = '/v1/main/common';
const API_SYSTEM_COMMON_PARAM =
    'AMC002,ABS010,ABS014,ABS018,ASS021,ABS013,ARI003'; // 시스템 코드
const API_SYSTEM_DASHBOARD = '/total-v2'; // 대시보드

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
  Json
 */

// common
const TAG_DATA = 'payload'; // response data tag
const TAG_TIME = 'timestamp'; // response timestamp tag
const TAG_MSG = 'message'; // response message tag
const TAG_ERROR = 'errors'; // response error tag
const TAG_RETURN_OBJECT = 'data'; // response data object tag
const TAG_RETURN_LIST_OBJECT = 'data-list'; // response data-list object tag

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
  HIVE DB
 */

const LOCAL_DB = 'LOCAL_DB'; // Box name
const KEY_THEME_MODE = 'isDark'; // ThemeMode Key
const KEY_SAVED_ID = 'savedId'; // save id Key
const KEY_SAVED_TOKEN = 'token'; // save token Key
const KEY_AUTH_URL = 'baseUrl'; // auth api url
const KEY_BASE_URL = 'baseUrl'; // target api url Key
const KEY_SHOW_ADMOB = 'isShowAdmob'; // 광고 보기 Key
const KEY_CUSTOM_FILTER = 'isCustomFilter'; // '거래처필터링 사용' Key
const KEY_INCLUDE_SALCHRG = 'isIncludeSalChrgCd'; // '영업사원 선택시 관리담당 포함' Key
const KEY_COMPARE_FIRST = 'isCompareFirst'; // '초성검색시 첫글자부터 비교' Key
