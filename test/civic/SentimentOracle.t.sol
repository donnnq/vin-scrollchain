// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../../contracts/vinPublicSentimentOracle.sol";

contract SentimentOracleTest is Test {
    vinPublicSentimentOracle oracle;

    function setUp() public {
        oracle = new vinPublicSentimentOracle();
    }

    function testLogSupport() public {
        oracle.logSentiment("Supportive");
        assertEq(oracle.latestSentiment(), "Supportive");
    }
}
