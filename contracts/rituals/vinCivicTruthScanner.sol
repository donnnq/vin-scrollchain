// SPDX-License-Identifier: Resonance
pragma solidity ^0.8.0;

contract vinCivicTruthScanner {
    struct PublicFigure {
        string name;
        bool exempted;
        uint transparencyScore;
        uint consistencyScore;
        uint dignityScore;
    }

    mapping(string => PublicFigure) public ledger;

    function logFigure(
        string memory _name,
        bool _exempted,
        uint _transparency,
        uint _consistency,
        uint _dignity
    ) public {
        ledger[_name] = PublicFigure(_name, _exempted, _transparency, _consistency, _dignity);
    }

    function scan(string memory _name) public view returns (string memory) {
        PublicFigure memory pf = ledger[_name];
        if (pf.exempted) {
            return string(abi.encodePacked("🛡️ ", pf.name, " is exempted from civic scanning by decree."));
        }

        uint totalScore = pf.transparencyScore + pf.consistencyScore + pf.dignityScore;
        if (totalScore < 150) {
            return string(abi.encodePacked("🚨 ", pf.name, " flagged for civic inconsistency. Total Score: ", uint2str(totalScore)));
        } else {
            return string(abi.encodePacked("✅ ", pf.name, " passes civic resonance scan. Total Score: ", uint2str(totalScore)));
        }
    }

    function uint2str(uint _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}
