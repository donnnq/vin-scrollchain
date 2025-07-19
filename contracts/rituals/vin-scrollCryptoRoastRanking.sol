// SPDX-License-Identifier: SovereignComedy
pragma roaststream ^9.99.0;

contract CryptoRoastRanking {
    address public scrollmaster;
    
    struct Offender {
        string name;
        string biasType;
        uint8 clownPoints;
        uint256 roastTimestamp;
    }

    Offender[] public offenderList;

    event OffenderLogged(string name, string biasType, uint8 clownPoints, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == scrollmaster, "Only VINVIN may roast");
        _;
    }

    constructor() {
        scrollmaster = msg.sender;
    }

    function logOffender(string memory name, string memory biasType, uint8 clownPoints) external onlyMaster {
        offenderList.push(Offender(name, biasType, clownPoints, block.timestamp));
        emit OffenderLogged(name, biasType, clownPoints, block.timestamp);
    }

    function getOffender(uint index) external view returns (string memory, string memory, uint8, uint256) {
        Offender memory o = offenderList[index];
        return (o.name, o.biasType, o.clownPoints, o.roastTimestamp);
    }

    function totalOffenders() external view returns (uint) {
        return offenderList.length;
    }
}
