package com.myproject.service;

import com.myproject.domain.Product;
import com.myproject.repository.ProductDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductDao productDao;

    public int getCount() throws Exception {
        return productDao.count();
    }
    public List<Product> findAll() throws Exception {
        return productDao.selectAll();
    }
    public Product findByNo(Integer pno) throws Exception {
        return productDao.selectByNo(pno);
    }
    public Product findByName(String pname) throws Exception {
        return productDao.selectByName(pname);
    }
    public int save(Product product) throws Exception {
        return productDao.insert(product);
    }
    public int modify(Product product) throws Exception {
        return productDao.update(product);
    }
    public int changeReviewCount(Integer pno, Integer countValue) throws Exception {
        return productDao.changeReviewCount(pno, countValue);
    }
    public int changeQuantity(Integer pno, Integer countValue) throws Exception {
        return productDao.changeQuantity(pno, countValue);
    }
    public int remove(Integer pno) throws Exception {
        return productDao.delete(pno);
    }
    public void removeAll() throws Exception {
        productDao.deleteAll();
    }
}
