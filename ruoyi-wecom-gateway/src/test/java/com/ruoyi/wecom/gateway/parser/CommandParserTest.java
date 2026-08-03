package com.ruoyi.wecom.gateway.parser;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * CommandParser 单元测试（{@code @Tag("dev")} 由父 pom 的 surefire groups 过滤）。
 */
@Tag("dev")
class CommandParserTest {

    // -------- normalize() --------

    @Test
    void normalize_nullInput_returnsEmptyString() {
        assertEquals("", CommandParser.normalize(null));
    }

    @Test
    void normalize_emptyInput_returnsEmptyString() {
        assertEquals("", CommandParser.normalize(""));
        assertEquals("", CommandParser.normalize("   "));
        assertEquals("", CommandParser.normalize("\t\n"));
    }

    @Test
    void normalize_trimsLeadingAndTrailingSpaces() {
        assertEquals("hello world", CommandParser.normalize("   hello world   "));
    }

    @Test
    void normalize_collapsesInternalSpaces() {
        assertEquals("hello world", CommandParser.normalize("hello    world"));
        assertEquals("a b c", CommandParser.normalize("a   b\t\tc"));
    }

    @Test
    void normalize_lowercasesAsciiLetters() {
        assertEquals("hello world", CommandParser.normalize("Hello World"));
        assertEquals("查库存 sku-001", CommandParser.normalize("查库存 SKU-001"));
    }

    // -------- parse() --------

    @Test
    void parse_emptyInput_returnsEmptyPair() {
        assertArrayEquals(new String[]{"", ""}, CommandParser.parse(""));
        assertArrayEquals(new String[]{"", ""}, CommandParser.parse(null));
    }

    @Test
    void parse_noSpace_returnsWholeAsName() {
        assertArrayEquals(new String[]{"查库存", ""}, CommandParser.parse("查库存"));
    }

    @Test
    void parse_oneSpace_splitsNameAndArgs() {
        assertArrayEquals(new String[]{"查库存", "sku-001"}, CommandParser.parse("查库存 sku-001"));
    }

    @Test
    void parse_multipleSpaces_inArgs_keepsOnlyTrimmed() {
        // args 部分仍 trim 一次（归一化后已经 collapse 为单空格）
        assertArrayEquals(new String[]{"查库存", "a b c"}, CommandParser.parse("查库存 a b c"));
    }

    @Test
    void parse_trailingSpace_emptyArgs() {
        assertArrayEquals(new String[]{"查库存", ""}, CommandParser.parse("查库存 "));
    }

    @Test
    void parse_realisticFlow_normalizeThenParse() {
        String raw = "  查库存  SKU-001  ";
        String norm = CommandParser.normalize(raw);
        String[] parts = CommandParser.parse(norm);
        assertEquals("查库存", parts[0]);
        assertEquals("sku-001", parts[1]);
        assertTrue(norm.contains("sku-001"));
    }
}
