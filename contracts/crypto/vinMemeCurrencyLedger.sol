// SPDX-License-Identifier: Meme-Ledger
pragma solidity ^0.8.19;

contract vinMemeCurrencyLedger {
    address public steward;

    struct MemeCoin {
        string name;
        uint256 volatilityIndex;
        string influencer;
        uint256 civicImpactScore;
        string notes;
    }

    MemeCoin[] public ledger;

    event MemeLogged(string name, uint256 volatilityIndex, uint256 civicImpactScore);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized scroll access");
        _;
    }

    function logMemeCoin(
        string memory _name,
        uint256 _volatilityIndex,
        string memory _influencer,
        uint256 _civicImpactScore,
        string memory _notes
    ) public onlySteward {
        ledger.push(MemeCoin(_name, _volatilityIndex, _influencer, _civicImpactScore, _notes));
        emit MemeLogged(_name, _volatilityIndex, _civicImpactScore);
    }

    function getMemeCoin(uint256 index) public view returns (MemeCoin memory) {
        return ledger[index];
    }
}
