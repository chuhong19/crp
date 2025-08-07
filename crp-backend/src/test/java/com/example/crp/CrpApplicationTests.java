package com.example.crp;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CrpApplicationTests {

  @Test
  void contextLoads() {}

  @Test
  void simpleAdditionTest() {
    int a = 2;
    int b = 3;
    assertEquals(5, a + b, "2 + 3 should equal 5");
  }
}
