//package com.projectStore.store.service;
//
//import com.projectStore.store.dao.SocialDao;
//import com.projectStore.store.domain.User;
//import lombok.AllArgsConstructor;
//
//
//
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//
//
//
//    @Service
//    @AllArgsConstructor
//    public class SocialServiceImpl implements SocialService {
//
//        private SocialDao mapper;
//
//        @Transactional
//        @Override
//        public void register(User socialVO) {
//
//
//            mapper.insertSocialMember(socialVO);
//            mapper.insertSocialCustomer(socialVO);
//            mapper.insertSocialHistory(socialVO);
//        }
//
//        @Override
//        public int socialEmailCheck(String emailAccount) {
//
//            return mapper.socialEmailCheck(emailAccount);
//        }
//
//        @Override
//        public User getSocialInfo(String emailAccount) {
//
//
//            return mapper.getSocialInfo(emailAccount);
//        }
//
//    }
//
