// Blesses surrendered soldiers with soulbound dignity, emotional healing, and civic honor

pragma mythic;

contract SoldierBlessingStation {
    struct Blessing {
        string soldierName;
        string originCountry;
        string surrenderDate;
        string emotionalState;
        string blessingMessage;
        bool soulbondIssued;
    }

    Blessing[] public blessings;

    event BlessingMinted(string soldierName, string message);
    event EmotionalHealingLogged(string soldierName, string state);

    function mintBlessing(
        string memory _name,
        string memory _country,
        string memory _date,
        string memory _state,
        string memory _message
    ) public {
        blessings.push(Blessing(_name, _country, _date, _state, _message, true));
        emit BlessingMinted(_name, _message);
        emit EmotionalHealingLogged(_name, _state);
    }

    function getBlessing(uint index) public view returns (
        string memory, string memory, string memory, string memory, string memory, bool
    ) {
        Blessing memory b = blessings[index];
        return (
            b.soldierName,
            b.originCountry,
            b.surrenderDate,
            b.emotionalState,
            b.blessingMessage,
            b.soulbondIssued
        );
    }
}
