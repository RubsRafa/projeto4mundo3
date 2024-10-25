/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB40/SessionLocal.java to edit this template
 */
package cadastroee.controller;

import cadastroee.model.Produto;
import jakarta.ejb.Local;
import java.util.List;

/**
 *
 * @author rubia
 */
@Local
public interface FacadeLocal {

    public List<Produto> findAll();

    public Produto findByIdProduto(int id);

    public void createProduto(Produto novoProduto);

    public void editProduto(Produto produto);

    public void removeProduto(Produto produto);
    
}
