package com.beadhouse.service;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.Pagenation;

public interface HistorychatService {
	/**
	 * 历史聊天记录列表
	 * @param pagenation
	 * @return
	 */
	public EUDataGridResult getHistorychatList(Pagenation pagenation);

}
