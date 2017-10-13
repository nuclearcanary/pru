defmodule Pru do
    @moduledoc """
    BeagleBone Black/Green PRU Helper Library
    """

    @doc """
    Loads the cape-universal and cape-univ-hdmi to maximize
    the number of available pins since HDMI is disabled

    Returns ':ok'

    ## Examples

    iex> Pru.init_pins
    :ok

    """
    def init_pins do
        # By default loads the cape-universal and cape-univ-hdmi
        # so the app has access to the max number of pins since
        # HDMI is disabled
        :os.cmd('config-pin overlay cape-universal > /dev/null')
        :os.cmd('config-pin overlay cape-univ-hdmi > /dev/null')
        {:ok}
    end

    @doc """
    Loads the rpmsg_pru kernel module to enable RPMsg communication.
    Enables /dev/rpmsg_pru3(0/1) depending on which PRU has the
    correct calls to probe the module.

    Returns ':ok'

    ## Examples

    iex> Pru.init_rpmsg
    :ok

    """
    def init_rpmsg do
        :os.cmd('modprobe rpmsg_pru')
        {:ok}
    end

    @doc """
    Boots the specified PRU core.

    Returns ':ok'

    ## Examples

    iex> Pru.boot 0
    :ok

    """
    def boot( pru ) do
        case pru do
            0 ->
                :os.cmd('echo "4a334000.pru0" > /sys/bus/platform/drivers/pru-rproc/bind')
                {:ok}
            1 ->
                :os.cmd('echo "4a338000.pru1" > /sys/bus/platform/drivers/pru-rproc/bind')
                {:ok}
            _ ->
                {:error}
        end
    end

    @doc """
    Halts the specified PRU core.

    Returns ':ok'

    ## Examples

    iex> Pru.boot 0
    :ok

    """
    def halt( pru ) do
        # Sends command to halt the specified PRU Core
        case pru do
            0 ->
                :os.cmd('echo "4a334000.pru0" > /sys/bus/platform/drivers/pru-rproc/unbind')
                {:ok}
            1 ->
                :os.cmd('echo "4a338000.pru1" > /sys/bus/platform/drivers/pru-rproc/unbind')
                {:ok}
            _ ->
                {:error}
        end
    end

    @doc """
    Reboots the specified PRU core.

    Returns ':ok'

    ## Examples

    iex> Pru.reboot 0
    :ok

    """
    def reboot( pru ) do
        halt pru
        boot pru
        {:ok}
    end

    @doc """
    Enables the specified pin for use as a GPIO output for the PRUs.

    Returns ':ok'

    ## Examples

    iex> Pru.pin_out 'P8_11'
    :ok

    """
    def pin_out( pin ) do
        :os.cmd('config-pin #{pin} pruout')
        {:ok}
    end

    @doc """
    Enables the specified pin for use as a GPIO input for the PRUs.

    Returns ':ok'

    ## Examples

    iex> Pru.pin_in 'P8_11'
    :ok

    """
    def pin_in( pin ) do
        :os.cmd('config-pin #{pin} pruin')
        {:ok}
    end
end
