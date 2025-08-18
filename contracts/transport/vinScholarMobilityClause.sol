// vinScholarMobilityClause.sol
// Ritual-grade clause for scholar lanes with safety toll blessing

contract vinScholarMobilityClause {
    string public glyph = "Bawat gulong ng karunungan, may bantay na pagmamahal.";
    address public steward = 0xVinvinScrollsmith;
    uint public tollFee = 20; // PHP
    bool public isGuarded = true;

    struct ScholarLane {
        string city;
        bool active;
        bool guarded;
        uint toll;
    }

    mapping(string => ScholarLane) public lanes;

    event ScholarLaneBlessed(string city, uint toll, bool guarded);

    function blessLane(string memory city) public {
        lanes[city] = ScholarLane(city, true, isGuarded, tollFee);
        emit ScholarLaneBlessed(city, tollFee, isGuarded);
    }

    function getLaneStatus(string memory city) public view returns (string memory) {
        ScholarLane memory lane = lanes[city];
        if (!lane.active) return "🚫 Lane not yet blessed.";
        return string(abi.encodePacked("🚲 Scholar lane in ", city, " is active. Toll: ₱", uint2str(lane.toll), ". Guarded: ", lane.guarded ? "Yes" : "No"));
    }

    function uint2str(uint _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint j = _i;
        uint len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}
