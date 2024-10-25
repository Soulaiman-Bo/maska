package com.javangers.controller;

import com.javangers.entity.Membre;
import com.javangers.service.MembreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MembreController {

    @Autowired
    private MembreService membreService;

    @GetMapping("/save")
    public String index(Model model) {
        model.addAttribute("membre", new Membre());
        return "addMembre";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("membre") Membre membre) {
        membreService.save(membre);
        return "redirect:/list";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<Membre> list = membreService.findAll();
        model.addAttribute("list", list);
        return "listMembre";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        membreService.deleteById(id);
        return "redirect:/list";
    }

}