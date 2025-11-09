// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MaritimeDefenseDAO {
    address public validator;
    mapping(address => uint256) public contributions;
    uint256 public totalFunds;

    event ContributionReceived(address contributor, uint256 amount);
    event FundsWithdrawn(address to, uint256 amount);

    constructor() {
        validator = msg.sender;
    }

    function contribute() public payable {
        contributions[msg.sender] += msg.value;
        totalFunds += msg.value;
        emit ContributionReceived(msg.sender, msg.value);
    }

    function withdrawFunds(address payable _to, uint256 _amount) public {
        require(msg.sender == validator, "Not authorized");
        require(_amount <= totalFunds, "Insufficient funds");
        totalFunds -= _amount;
        _to.transfer(_amount);
        emit FundsWithdrawn(_to, _amount);
    }

    function getContribution(address _addr) public view returns (uint256) {
        return contributions[_addr];
    }
}
