// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToProductToxicityLedger {
    string public batchID = "1321.9.197";
    string public steward = "Vinvin";

    address public admin;

    struct Toxicity {
        string product;     // jewelry, toy, cosmetic
        string substance;   // lead, cadmium, carcinogen
        uint256 level;      // measured ppm or mg/kg
        string status;      // safe, unsafe, banned
        uint256 timestamp;
    }

    Toxicity[] public toxicities;

    event ToxicityLogged(string product, string substance, uint256 level, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logToxicity(string memory product, string memory substance, uint256 level, string memory status) public onlyAdmin {
        toxicities.push(Toxicity(product, substance, level, status, block.timestamp));
        emit ToxicityLogged(product, substance, level, status);
    }

    function getToxicity(uint256 index) public view returns (string memory product, string memory substance, uint256 level, string memory status, uint256 timestamp) {
        Toxicity memory t = toxicities[index];
        return (t.product, t.substance, t.level, t.status, t.timestamp);
    }
}
