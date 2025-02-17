package application.controller;

import java.util.Optional;

import org.sptringframework.beans.factory.annotation.Autowired;
import org.sptringframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Categoria;
import application.repository.CategoriaRepository;

@Controller
@RequestMapping("/categoria")
public class CategoriaController {
    @Autowired
    private CategoriaRepository categoriaRepo;

    @RequestMapping("/list")
    public String list(model ui) {
        ui.addAtrribute("categorias", categoriaRepo.findAll());
        return "categoria/list";
    }

    @RequestMapping("/insert")
    public String insert() {
        return "categoria/insert";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(@RequestParam("nome") String nome) {
        Categoria categoria = new Categoria();
        categoria.setNome(nome);

        categoriaRepo.save(categoria);

        return "redirect:/categoria/list";
    }

    @RequestMapping("/update")
    public String update(@RequestParam("id") long id, Model ui) {
        Optional<Categoria> categoria = categoriaRepo.findById(id);

        if (categoria.isPresent()) {
            ui.addAtrribute("categoria", categoria.get());
            return "categoria/update";
        }

        return "redirect:/categoria/list";
    }
}