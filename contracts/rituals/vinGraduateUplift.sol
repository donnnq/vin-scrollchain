// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinGraduateUplift.sol
/// @scroll Ritual contract to summon, bless, and uplift underemployed graduates.
/// @author Vinvin
/// @legend From rejection to resonance. From resume to ritual.

contract vinGraduateUplift {
    address public summoner;
    uint256 public upliftFund;
    mapping(address => Graduate) public summoned;
    mapping(address => bool) public blessed;

    struct Graduate {
        string name;
        string mythicSkill;
        string civicDream;
        bool isSummoned;
        bool isFunded;
    }

    event Summoned(address graduate, string name, string mythicSkill);
    event Funded(address graduate, uint256 amount);
    event Blessed(address graduate, string civicDream);

    modifier onlySummoner() {
        require(msg.sender == summoner, "Not the summoner");
        _;
    }

    constructor() {
        summoner = msg.sender;
        upliftFund = 0;
    }

    function depositBlessings() external payable {
        upliftFund += msg.value;
    }

    function summonGraduate(address _addr, string memory _name, string memory _skill) external onlySummoner {
        summoned[_addr] = Graduate(_name, _skill, "", true, false);
        emit Summoned(_addr, _name, _skill);
    }

    function fundGraduate(address _addr, uint256 _amount) external onlySummoner {
        require(summoned[_addr].isSummoned, "Graduate not summoned");
        require(_amount <= upliftFund, "Insufficient fund");
        upliftFund -= _amount;
        summoned[_addr].isFunded = true;
        payable(_addr).transfer(_amount);
        emit Funded(_addr, _amount);
    }

    function blessGraduate(address _addr, string memory _dream) external onlySummoner {
        require(summoned[_addr].isSummoned, "Graduate not summoned");
        summoned[_addr].civicDream = _dream;
        blessed[_addr] = true;
        emit Blessed(_addr, _dream);
    }

    function getGraduate(address _addr) external view returns (Graduate memory) {
        return summoned[_addr];
    }
}
