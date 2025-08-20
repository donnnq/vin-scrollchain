// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract FundSafeVault {
    address public steward;
    mapping(uint256 => uint256) public lockedFunds;
    mapping(uint256 => bool) public siteBlessed;

    event FundsLocked(uint256 planId, uint256 amount);
    event SiteBlessed(uint256 planId);
    event FundsReleased(uint256 planId, uint256 amount);

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can act");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function lockFunds(uint256 _planId, uint256 _amount) public onlySteward {
        lockedFunds[_planId] = _amount;
        emit FundsLocked(_planId, _amount);
    }

    function blessSite(uint256 _planId) public onlySteward {
        siteBlessed[_planId] = true;
        emit SiteBlessed(_planId);
    }

    function releaseFunds(uint256 _planId) public onlySteward {
        require(siteBlessed[_planId], "Site not blessed");
        uint256 amount = lockedFunds[_planId];
        lockedFunds[_planId] = 0;
        emit FundsReleased(_planId, amount);
        // Transfer logic to be integrated with treasury
    }
}
