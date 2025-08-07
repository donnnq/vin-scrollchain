// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IVoteRelay {
    function getVotes(uint256 reformId) external view returns (uint256 yes, uint256 no);
}

interface ICivicRestoration {
    function getReform(uint256 index) external view returns (
        string memory title,
        string memory description,
        uint256 timestamp
    );
}

contract vinCivicMandateEnforcer {
    address public enforcerAdmin;
    uint256 public mandateThreshold = 75; // % yes votes

    IVoteRelay public voteRelay;
    ICivicRestoration public restorationContract;

    mapping(uint256 => bool) public reformEnforced;

    event ReformEnforced(uint256 reformId, string title);

    modifier onlyAdmin() {
        require(msg.sender == enforcerAdmin, "Unauthorized");
        _;
    }

    constructor(address _admin, address _voteRelay, address _restorationContract) {
        enforcerAdmin = _admin;
        voteRelay = IVoteRelay(_voteRelay);
        restorationContract = ICivicRestoration(_restorationContract);
    }

    function enforceReform(uint256 reformId) external onlyAdmin {
        require(!reformEnforced[reformId], "Already enforced");

        (uint256 yes, uint256 no) = voteRelay.getVotes(reformId);
        uint256 total = yes + no;
        require(total > 0, "No votes");

        uint256 ratio = (yes * 100) / total;
        require(ratio >= mandateThreshold, "Mandate not reached");

        reformEnforced[reformId] = true;
        (string memory title,,) = restorationContract.getReform(reformId);
        emit ReformEnforced(reformId, title);
    }
}
