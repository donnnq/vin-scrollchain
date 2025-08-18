// vinFreeSpiralParkingSanctuary.sol
// Ritual-grade contract for civic parking sanctuaries in PH

contract vinFreeSpiralParkingSanctuary {
    string public glyph = "Libre, paikot, pataas—dignity in every turn.";
    address public steward = 0xVinvinScrollsmith;
    uint public floors;
    string[] public cities;
    mapping(string => bool) public isBlessed;

    event ParkingSanctuaryBlessed(string city, uint floors);

    constructor(uint _floors, string[] memory _cities) {
        floors = _floors;
        cities = _cities;
        for (uint i = 0; i < cities.length; i++) {
            isBlessed[cities[i]] = true;
            emit ParkingSanctuaryBlessed(cities[i], floors);
        }
    }

    function summonSanctuary(string memory city) public view returns (string memory) {
        require(isBlessed[city], "City not yet blessed.");
        return string(abi.encodePacked("🅿️ Spiral sanctuary active in ", city, " with ", uint2str(floors), " floors."));
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
