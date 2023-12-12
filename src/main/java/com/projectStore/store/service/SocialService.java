package com.projectStore.store.service;

import com.projectStore.store.domain.User;
import org.springframework.transaction.annotation.Transactional;

public interface SocialService {
    @Transactional
    void register(User socialVO);

    int socialEmailCheck(String emailAccount);

    User getSocialInfo(String emailAccount);
}
