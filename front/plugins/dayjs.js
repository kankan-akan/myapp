import 'dayjs/locale/ja'
import dayjs from 'dayjs'
import LocalizedFormat from 'dayjs/plugin/localizedFormat'

dayjs.locale('ja')
dayjs.extend(LocalizedFormat)

dayjs().format('L LT')
