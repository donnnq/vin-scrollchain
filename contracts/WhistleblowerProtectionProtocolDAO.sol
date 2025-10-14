// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerProtectionProtocolDAO {
    address public admin;

    struct Whistleblower {
        address wallet;
        string caseReference;
        bool protected;
    }

    mapping(address => Whistleblower) public whistleblowers;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerWhistleblower(address _wallet, string memory _caseReference) external onlyAdmin {
        whistleblowers[_wallet] = Whistleblower(_wallet, _caseReference, true);
    }

    function getWhistleblower(address _wallet) external view returns (Whistleblower memory) {
        return whistleblowers[_wallet];
    }
}
