package DuAn2.Services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import DuAn2.Model.Post;

public interface PostService extends CrudRepository<Post, Long> {
	
	@Query("SELECT p FROM Post p ORDER BY p.id DESC")
    Page<Post> findAllByOrderByCreateDateDesc(Pageable pageable);
	
	@Query("SELECT p FROM Post p ORDER BY p.id DESC")
	public List<Post> findAllOrderByMaDesc();
	
	Page<Post> findAll(Pageable pageable);
	
	@Query("SELECT p FROM Post p WHERE p.title LIKE %?1%")
	Page<Post> findByTitle(String Title,Pageable pageable);
}

