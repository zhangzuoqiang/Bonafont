package com.danone.bonafont.batch.writer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.batch.item.file.MultiResourceItemWriter;

import com.danone.bonafont.batch.model.Qs3STO;

/**
 * @author Eduardo Rodriguez
 * 
 */
public class FlatFileMultiWriterQs3Sto extends MultiResourceItemWriter<Qs3STO> {

	private static final Logger LOG = Logger
			.getLogger(FlatFileMultiWriterQs3Sto.class);

	@Override
	public void write(List<? extends Qs3STO> items) throws Exception {
		LOG.info("Tama�o de lista original: " + items.size());
		Map<String, List<Qs3STO>> map = new HashMap<String, List<Qs3STO>>();
		for (Qs3STO orden : items) {
			if (map.containsKey(getKey(orden))) {
				List<Qs3STO> tmp = map.get(getKey(orden));
				tmp.add(orden);
				map.put(getKey(orden), tmp);
			} else {
				List<Qs3STO> nueva = new ArrayList<Qs3STO>();
				nueva.add(orden);
				map.put(getKey(orden), nueva);
			}
		}

		for (Map.Entry<String, List<Qs3STO>> entry : map.entrySet()) {
			LOG.info("Key de Lista: " + entry.getKey());
			LOG.info("Tamano de segmento: " + entry.getValue().size());
			setItemCountLimitPerResource(entry.getValue().size());
			super.write(addSequent(entry.getValue()));
		}
	}

	private String getKey(Qs3STO orden) {
		StringBuffer buffer = new StringBuffer();

		buffer.append(orden.getCh_pedidos3());
		
		return buffer.toString();
	}
	
	private List<Qs3STO> addSequent(List<Qs3STO> list){
		Integer nu_posicionitem = 10;
		Integer ch_numerolinea = 1; 
		for (Qs3STO qs3sto : list) {
//			qs3sto.setCh_pedfechaemb("");
			qs3sto.setCh_lote("");
			qs3sto.setCh_orderunit(getOrderUnit(qs3sto.getCh_orderunit()));
			qs3sto.setNu_posicionitem(nu_posicionitem);
			qs3sto.setCh_numerolinea("0001");
			nu_posicionitem += 10;
			ch_numerolinea++;
		}
		return list;
	}

	private String getOrderUnit(String ch_orderunit) {
		String result = "";
		if(ch_orderunit instanceof String){
			result = ch_orderunit.toUpperCase().replace('K', 'C');
		}
		return result;
	}

}
