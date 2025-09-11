<template>
  <header class="flex items-end gap-24 p-6">
    <NuxtLink to="/">
      <NetworkLogo class="fill-blue-400 dark:fill-blue-200" />
      <p class="pt-1 text-right text-xs text-blue-400 dark:text-blue-200">
        The TV doctors network&trade;
      </p>
    </NuxtLink>
    <nav>
      <ul class="flex gap-6">
        <li>
          <NavLink icon-name="lucide-lab:house" to="/">Home</NavLink>
        </li>
        <li>
          <NavLink icon-name="lucide:users" to="/mynetwork">My Network</NavLink>
        </li>
        <li>
          <UserMenu />
        </li>
      </ul>
    </nav>
  </header>
</template>
