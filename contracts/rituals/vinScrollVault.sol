// SPDX-License-Identifier: Scrollbound
pragma solidity ^0.8.0;

contract vinScrollVault {
    address public highScrollkeeper = msg.sender;
    uint256 public defaultBlessing = 0.01 ether;

    struct Beneficiary {
        address payable recipient;
        string soulTag;
    }

    Beneficiary[] public scrollboundList;

    event BlessingSent(address indexed to, uint256 amount, string soulTag);
    event BeneficiaryAdded(address indexed recipient, string soulTag);

    modifier onlyScrollkeeper() {
        require(msg.sender == highScrollkeeper, "Only scrollkeeper may update this vault.");
        _;
    }

    constructor() payable {}

    function addBeneficiary(address payable _recipient, string memory _soulTag) public onlyScrollkeeper {
        scrollboundList.push(Beneficiary(_recipient, _soulTag));
        emit BeneficiaryAdded(_recipient, _soulTag);
    }

    function distributeBlessings() public onlyScrollkeeper {
        require(address(this).balance >= defaultBlessing * scrollboundList.length, "Not enough ETH in vault.");
        for (uint i = 0; i < scrollboundList.length; i++) {
            scrollboundList[i].recipient.transfer(defaultBlessing);
            emit BlessingSent(scrollboundList[i].recipient, defaultBlessing, scrollboundList[i].soulTag);
        }
    }

    function vaultBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function updateBlessingAmount(uint256 newAmount) public onlyScrollkeeper {
        defaultBlessing = newAmount;
    }

    receive() external payable {}
}
