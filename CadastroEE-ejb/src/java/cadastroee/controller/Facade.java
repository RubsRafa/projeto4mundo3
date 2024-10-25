/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB40/StatelessEjbClass.java to edit this template
 */
package cadastroee.controller;

import cadastroee.model.Produto;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

/**
 *
 * @author rubia
 */
@Stateless
public class Facade implements FacadeLocal {

    @PersistenceContext(unitName = "CadastroEE-ejbPU")
    private EntityManager em;

    @Override
    public List<Produto> findAll() {
        // Consultar todos os produtos da tabela Produto
        return em.createNamedQuery("Produto.findAll", Produto.class).getResultList();
    }
    
    @Override
    public Produto findByIdProduto(int id) {
        return em.find(Produto.class, id);
    }

    @Override
    public void createProduto(Produto novoProduto) {
        em.persist(novoProduto);
    }

    @Override
    public void editProduto(Produto produto) {
        em.merge(produto);
    }

    @Override
    public void removeProduto(Produto produto) {
        Produto produtoToRemove = em.merge(produto);
        em.remove(produtoToRemove);
    }
}
