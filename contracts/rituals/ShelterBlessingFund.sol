pragma mythic;

contract ShelterBlessingFund {
    struct Beneficiary {
        address wallet;
        string name;
        string situation;
        uint blessingAmount;
        bool blessed;
    }

    Beneficiary[] public recipients;

    event BlessingReleased(address wallet, uint amount, string name);

    function bless(
        address payable _wallet,
        string memory _name,
        string memory _situation,
        uint _amount
    ) public {
        recipients.push(Beneficiary(_wallet, _name, _situation, _amount, true));
        _wallet.transfer(_amount);
        emit BlessingReleased(_wallet, _amount, _name);
    }

    function getRecipient(uint index) public view returns (
        address, string memory, string memory, uint, bool
    ) {
        Beneficiary memory b = recipients[index];
        return (b.wallet, b.name, b.situation, b.blessingAmount, b.blessed);
    }

    receive() external payable {}
}
