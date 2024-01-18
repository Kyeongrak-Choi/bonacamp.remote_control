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
const ROUTE_SERVER_LIST = '/list';

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

const API_SIGN_IN = '/api/v1/admin/otp/sign-in';
const API_VALID = '/api/v1/admin/otp/valid';
const API_GET_SERVER_LIST ='/api/v1/admin/servers';
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
const KEY_SAVED_ID = 'savedId'; // save id Key
const KEY_SAVED_CODE = 'code'; // save valid code
const KEY_SAVED_IMG = 'savedImg'; // save img Key
const KEY_BASE_URL = 'http://172.27.235.104:3758'; // target api url Key

/*
  UI
 */
const BASIC_PADDING = 8.0;