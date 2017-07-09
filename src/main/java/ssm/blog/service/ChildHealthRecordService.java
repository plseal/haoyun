package ssm.blog.service;

import ssm.blog.entity.ChildHealthRecord;
import java.util.*;
/**
 * @Description 
 * @author songml
 *
 */
public interface ChildHealthRecordService {

	public ChildHealthRecord get_chr(ChildHealthRecord chr);
	public ChildHealthRecord get_one_chr_byid(ChildHealthRecord chr);
	public Integer update_chr(ChildHealthRecord chr);
	public Integer insert_chr(ChildHealthRecord chr);
	public Integer delete_chr(ChildHealthRecord chr);
	public List<ChildHealthRecord> get_one_child_records(ChildHealthRecord chr);

}
