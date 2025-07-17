// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinScrollSuiteSyncRegistry {
    struct TestSuite {
        string suiteName;
        uint256 passed;
        uint256 failed;
        uint256 timestamp;
        string auraNote;
    }

    mapping(uint256 => TestSuite) public suiteLog;
    uint256 public logCounter;

    event SuiteSynced(
        uint256 indexed suiteId,
        string suiteName,
        uint256 passed,
        uint256 failed,
        string auraNote
    );

    function logSuite(
        string memory _suiteName,
        uint256 _passed,
        uint256 _failed,
        string memory _auraNote
    ) public {
        suiteLog[logCounter] = TestSuite(
            _suiteName,
            _passed,
            _failed,
            block.timestamp,
            _auraNote
        );

        emit SuiteSynced(logCounter, _suiteName, _passed, _failed, _auraNote);
        logCounter++;
    }

    function getSuite(uint256 _id) public view returns (TestSuite memory) {
        return suiteLog[_id];
    }
}
