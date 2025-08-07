pragma solidity ^0.8.0;

contract vinChronoLedger {
    struct ChronoStamp {
        string ritualTag;
        uint256 timestamp;
        address oracleAddress;
    }

    mapping(string => ChronoStamp) public chronoStamps;

    event ChronoMarked(string ritualTag, uint256 timestamp, address oracle);

    function markChrono(string memory _ritualTag, address _oracleAddress) public {
        chronoStamps[_ritualTag] = ChronoStamp(_ritualTag, block.timestamp, _oracleAddress);
        emit ChronoMarked(_ritualTag, block.timestamp, _oracleAddress);
    }

    function getChronoData(string memory _ritualTag) public view returns (ChronoStamp memory) {
        return chronoStamps[_ritualTag];
    }
}
